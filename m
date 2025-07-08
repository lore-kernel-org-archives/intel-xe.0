Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A028C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 15:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A7110E694;
	Tue,  8 Jul 2025 15:20:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E010E693;
 Tue,  8 Jul 2025 15:20:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4645511922238191075=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/sched=3A_Consolidate_d?=
 =?utf-8?q?rm=5Fsched=5Frq=5Fselect=5Fentity=5Frr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 15:20:12 -0000
Message-ID: <175198801217.144352.1344141362443146656@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
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

--===============4645511922238191075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/sched: Consolidate drm_sched_rq_select_entity_rr
URL   : https://patchwork.freedesktop.org/series/151335/
State : failure

== Summary ==

CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL -> xe-pw-151335v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151335v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151335v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151335v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html

  
New tests
---------

  New tests have been introduced between xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL and xe-pw-151335v1_FULL:

### New IGT tests (1) ###

  * igt@kms_flip@dpms-off-confusion@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [3.96] s

  

Known issues
------------

  Here are the changes found in xe-pw-151335v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3] ([Intel XE#4208])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@eof:
    - shard-adlp:         [PASS][4] -> [SKIP][5] ([Intel XE#2134])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@fbdev@eof.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@fbdev@eof.html

  * igt@intel_sysfs_debugfs@xe-base:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#4208] / [Intel XE#4618]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@intel_sysfs_debugfs@xe-base.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@intel_sysfs_debugfs@xe-base.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +139 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#3862]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#3862]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2724])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [PASS][30] -> [SKIP][31] ([Intel XE#4950]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#4208] / [i915#2575]) +60 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2244])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#4543]) +5 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#4543]) +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#1874])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [PASS][48] -> [SKIP][49] ([Intel XE#4947]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2934])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#3012])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#4208] / [i915#2575]) +19 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2393])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3414] / [Intel XE#3904])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#2883]) +3 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#4208]) +157 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#1392]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][69] -> [SKIP][70] ([Intel XE#4945]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_compute_mode@twice-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4837])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4943]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#4937])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][75] -> [DMESG-WARN][76] ([Intel XE#3876])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#4208]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#579])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#4819]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#944])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4208]) +116 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][85] ([Intel XE#4208]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#2134]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@fbdev@write.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][89] ([Intel XE#4543]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][91] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][93] ([Intel XE#2291]) -> [PASS][94] +8 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][95] ([Intel XE#2316]) -> [PASS][96] +4 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#4208] / [i915#2575]) -> [PASS][98] +63 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][99] ([Intel XE#4543]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-3/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][102] +6 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][103] ([Intel XE#3012]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][105] ([Intel XE#4596]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [DMESG-WARN][107] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][108] +7 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@kms_pm_rpm@i2c.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][109] ([Intel XE#1435]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#4208]) -> [PASS][112] +129 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1392]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4208] / [i915#2575]) -> [SKIP][116] ([Intel XE#623])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         [SKIP][117] ([Intel XE#1124]) -> [SKIP][118] ([Intel XE#4947]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#316]) -> [SKIP][120] ([Intel XE#2351] / [Intel XE#4208])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#4208]) -> [SKIP][122] ([Intel XE#316]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][123] ([Intel XE#316]) -> [SKIP][124] ([Intel XE#4947])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][126] ([Intel XE#316])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#4208]) -> [SKIP][128] ([Intel XE#1124]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1124]) -> [SKIP][130] ([Intel XE#4208]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#619]) -> [SKIP][132] ([Intel XE#2351] / [Intel XE#4208])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124]) -> [SKIP][134] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#4208] / [i915#2575]) -> [SKIP][136] ([Intel XE#2191])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2191]) -> [SKIP][138] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#4208] / [i915#2575])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208] / [i915#2575]) -> [SKIP][142] ([Intel XE#367]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][143] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#4947])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208]) -> [SKIP][148] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][150] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][151] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [DMESG-WARN][152] ([Intel XE#1727] / [Intel XE#3113])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2907]) -> [SKIP][154] ([Intel XE#4208])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][156] ([Intel XE#4208]) +8 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][158] ([Intel XE#4418])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#306]) -> [SKIP][160] ([Intel XE#4208] / [i915#2575])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#4208] / [i915#2575]) -> [SKIP][162] ([Intel XE#306]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         [SKIP][163] ([Intel XE#373]) -> [SKIP][164] ([Intel XE#4950])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_chamelium_edid@dp-mode-timings.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#4208] / [i915#2575]) -> [SKIP][166] ([Intel XE#373]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#373]) -> [SKIP][168] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][169] ([Intel XE#1178]) -> [SKIP][170] ([Intel XE#2341])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_content_protection@atomic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#4208] / [i915#2575]) -> [FAIL][172] ([Intel XE#1178])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#307]) -> [SKIP][174] ([Intel XE#4208] / [i915#2575])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#1178]) -> [SKIP][176] ([Intel XE#4208] / [i915#2575])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_content_protection@srm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#308]) -> [SKIP][178] ([Intel XE#4208] / [i915#2575])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         [SKIP][179] ([Intel XE#455]) -> [SKIP][180] ([Intel XE#4950]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208] / [i915#2575]) -> [SKIP][182] ([Intel XE#455]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#4208] / [i915#2575]) -> [SKIP][184] ([Intel XE#308])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         [SKIP][185] ([Intel XE#309]) -> [SKIP][186] ([Intel XE#4950])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208]) -> [SKIP][188] ([Intel XE#4356])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#455]) -> [SKIP][190] ([Intel XE#2351] / [Intel XE#4208])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#4422]) -> [SKIP][192] ([Intel XE#4208])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208] / [i915#2575]) -> [SKIP][194] ([Intel XE#1138])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1135]) -> [SKIP][196] ([Intel XE#4208] / [i915#2575])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-adlp:         [SKIP][197] ([Intel XE#310]) -> [SKIP][198] ([Intel XE#4950]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][199] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][200] ([Intel XE#4208] / [i915#2575])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][202] ([Intel XE#455]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#455]) -> [SKIP][204] ([Intel XE#4208])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][206] ([Intel XE#651]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#651]) -> [SKIP][208] ([Intel XE#4208]) +20 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2311]) -> [SKIP][210] ([Intel XE#2312]) +17 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#651]) -> [SKIP][212] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#5390]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][215] ([Intel XE#5390]) -> [SKIP][216] ([Intel XE#2312]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][218] ([Intel XE#658])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4208]) -> [SKIP][220] ([Intel XE#651]) +12 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][221] ([Intel XE#651]) -> [SKIP][222] ([Intel XE#4947]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2311]) +17 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#2313]) +17 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][227] ([Intel XE#656]) -> [SKIP][228] ([Intel XE#4947]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         [SKIP][229] ([Intel XE#653]) -> [SKIP][230] ([Intel XE#4947])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#653]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4208]) -> [SKIP][234] ([Intel XE#653]) +16 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][235] ([Intel XE#2313]) -> [SKIP][236] ([Intel XE#2312]) +15 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][238] ([Intel XE#653]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#653]) -> [SKIP][240] ([Intel XE#4208]) +19 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4208]) -> [SKIP][242] ([Intel XE#2925])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][243] ([Intel XE#5021]) -> [SKIP][244] ([Intel XE#4596])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#5021]) -> [SKIP][246] ([Intel XE#4208] / [i915#2575])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2938]) -> [SKIP][248] ([Intel XE#4208])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#870]) -> [SKIP][250] ([Intel XE#4208]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208]) -> [SKIP][252] ([Intel XE#1129])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#4208]) -> [SKIP][254] ([Intel XE#1489]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1489]) -> [SKIP][256] ([Intel XE#4208]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4208]) -> [SKIP][258] ([Intel XE#1122])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         [SKIP][259] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][260] ([Intel XE#4947]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][262] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][264] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [SKIP][266] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][268] ([Intel XE#4208]) +9 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208] / [i915#2575]) -> [SKIP][270] ([Intel XE#3414]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208] / [i915#2575]) -> [SKIP][272] ([Intel XE#1127])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#3414]) -> [SKIP][274] ([Intel XE#4208] / [i915#2575])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1127]) -> [SKIP][276] ([Intel XE#4208] / [i915#2575])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1500]) -> [SKIP][278] ([Intel XE#362])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_vrr@flipline.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2168]) -> [SKIP][282] ([Intel XE#4208] / [i915#2575])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_vrr@lobf.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4208]) -> [SKIP][284] ([Intel XE#455]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#1123])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1126]) -> [SKIP][288] ([Intel XE#4208])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         [SKIP][289] ([Intel XE#944]) -> [SKIP][290] ([Intel XE#4945])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_create@multigpu-create-massive-size.html
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#944]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208]) -> [SKIP][294] ([Intel XE#5419]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eu_stall@blocking-read.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208]) -> [SKIP][296] ([Intel XE#4837]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4837]) -> [SKIP][298] ([Intel XE#4208]) +10 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         [SKIP][299] ([Intel XE#4837]) -> [SKIP][300] ([Intel XE#4945])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_eudebug_online@single-step-one.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [SKIP][301] ([Intel XE#1392]) -> [SKIP][302] ([Intel XE#4945]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1392]) -> [SKIP][304] ([Intel XE#4208]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208]) -> [SKIP][306] ([Intel XE#288]) +14 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#288]) -> [SKIP][308] ([Intel XE#4208]) +18 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#2360])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
    - shard-adlp:         [SKIP][311] ([Intel XE#2360]) -> [SKIP][312] ([Intel XE#4945])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2360]) -> [SKIP][314] ([Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][315] ([Intel XE#3876]) -> [SKIP][316] ([Intel XE#4208])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4915]) -> [SKIP][318] ([Intel XE#4208]) +197 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - shard-adlp:         [SKIP][319] ([Intel XE#4915]) -> [SKIP][320] ([Intel XE#4945]) +19 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#4915]) +166 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#255])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#5103]) -> [SKIP][326] ([Intel XE#4208])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_oa@mmio-triggered-reports-read.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][328] ([Intel XE#4208]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#4208]) -> [SKIP][330] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][332] ([Intel XE#4208])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208]) -> [SKIP][334] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][335] ([Intel XE#977]) -> [SKIP][336] ([Intel XE#4945])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_pat@pat-index-xe2.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208]) -> [SKIP][338] ([Intel XE#977])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#979])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][341] ([Intel XE#1173]) -> [SKIP][342] ([Intel XE#1061])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_peer2peer@read.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1061]) -> [SKIP][344] ([Intel XE#1061] / [Intel XE#4208])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_peer2peer@write.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2284]) -> [SKIP][346] ([Intel XE#4208])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#579])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208]) -> [SKIP][350] ([Intel XE#4733])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#4733]) -> [SKIP][352] ([Intel XE#4208]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#944]) -> [SKIP][354] ([Intel XE#4208])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4814]) -> [SKIP][356] ([Intel XE#4208])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4821]) -> [SKIP][358] ([Intel XE#4208])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4130]) -> [SKIP][360] ([Intel XE#4208])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
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
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -> xe-pw-151335v1

  IGT_8445: 8445
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b
  xe-pw-151335v1: 151335v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html

--===============4645511922238191075==
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
<tr><td><b>Series:</b></td><td>drm/sched: Consolidate drm_sched_rq_select_entity_rr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151335/">https://patchwork.freedesktop.org/series/151335/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL -&gt; xe-pw-151335v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151335v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151335v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151335v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_FULL and xe-pw-151335v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@dpms-off-confusion@d-hdmi-a2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.96] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151335v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +116 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-2/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-3/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-8/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-2/igt@kms_pm_rpm@i2c.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +129 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-464/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +197 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-adlp-6/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-adlp-1/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -&gt; xe-pw-151335v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b<br />
  xe-pw-151335v1: 151335v1</p>

</body>
</html>

--===============4645511922238191075==--
