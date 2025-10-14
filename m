Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE160CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 15:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCBD10E648;
	Tue, 14 Oct 2025 15:40:25 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8110E647;
 Tue, 14 Oct 2025 15:40:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8975565718520186989=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_GT_runtime_suspe?=
 =?utf-8?q?nd/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 15:40:24 -0000
Message-ID: <176045642407.12247.10725544237367318343@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014073036.3282329-1-raag.jadav@intel.com>
In-Reply-To: <20251014073036.3282329-1-raag.jadav@intel.com>
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

--===============8975565718520186989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce GT runtime suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/154017/
State : failure

== Summary ==

CI Bug Log - changes from xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada_FULL -> xe-pw-154017v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154017v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154017v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154017v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_setmode@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_setmode@basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-154017v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][3] ([Intel XE#3884]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#610])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#316]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1477])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#787]) +23 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#2907])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2669]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +27 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#3862]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#306]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_chamelium_color@ctm-negative.html
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#306]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#373]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1468])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#308])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#309]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#5299])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#323])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#323])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#4302])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4354])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#4356])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#4331])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#701])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1135])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#310]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#301])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#4543]) +2 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][62] ([Intel XE#4543]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#455]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][66] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#4543])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1874]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#651]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][73] ([Intel XE#4543]) +5 other tests dmesg-fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656]) +17 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#651]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#653]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#3374] / [Intel XE#3544])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#1503]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_hdr@static-swap.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#3012])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4329])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#4596])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#870])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#836])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#1489])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#2893])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1406]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#1435])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#330])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#330])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1123])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#5626])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#4837] / [Intel XE#5565]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4837]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#4837]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#261])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#688])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1392]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#288] / [Intel XE#5561]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4915]) +98 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4943]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4915]) +21 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][119] ([Intel XE#5466])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-adlp:         NOTRUN -> [ABORT][120] ([Intel XE#5530])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#5100])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_mmap@pci-membarrier.html
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#5100])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_mmap@pci-membarrier.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#3573]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1337] / [Intel XE#5572])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1337])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#977])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4650]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4733])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#944])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#944])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#4814] / [Intel XE#5614])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][135] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4351])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][137] -> [ABORT][138] ([Intel XE#4917]) +1 other test abort
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][139] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][141] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][143] ([Intel XE#2291]) -> [PASS][144] +4 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][145] ([Intel XE#4354]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][147] ([Intel XE#2316]) -> [PASS][148] +7 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][151] ([Intel XE#4543]) -> [PASS][152] +5 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][153] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][155] ([Intel XE#4543]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][157] ([Intel XE#1503]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][159] ([Intel XE#4596]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][161] ([Intel XE#1435]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][163] ([Intel XE#2341]) -> [FAIL][164] ([Intel XE#1178])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][165] ([Intel XE#1178]) -> [SKIP][166] ([Intel XE#2341])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][167] ([Intel XE#2311]) -> [SKIP][168] ([Intel XE#2312]) +20 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][169] ([Intel XE#2312]) -> [SKIP][170] ([Intel XE#5390]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][171] ([Intel XE#5390]) -> [SKIP][172] ([Intel XE#2312]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2311]) +14 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#2313]) +12 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][177] ([Intel XE#2313]) -> [SKIP][178] ([Intel XE#2312]) +19 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][179] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][180] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5572]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada -> xe-pw-154017v2

  IGT_8582: 8582
  xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada: c917f7d11493984be9f381ca0a7667bd3e587ada
  xe-pw-154017v2: 154017v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/index.html

--===============8975565718520186989==
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
<tr><td><b>Series:</b></td><td>Introduce GT runtime suspend/resume (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154017/">https://patchwork.freedesktop.org/series/154017/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada_FULL -&gt; xe-pw-154017v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154017v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154017v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154017v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_setmode@basic:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_setmode@basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154017v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_eu_stall@unprivileged-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572">Intel XE#5572</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154017v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada -&gt; xe-pw-154017v2</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada: c917f7d11493984be9f381ca0a7667bd3e587ada<br />
  xe-pw-154017v2: 154017v2</p>

</body>
</html>

--===============8975565718520186989==--
