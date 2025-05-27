Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0F3C5B542
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 21:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5355710E52A;
	Tue, 27 May 2025 21:20:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33AA10E547;
 Tue, 27 May 2025 21:20:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5703239532785924269=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Panel_Replay_+_Adaptive_sy?=
 =?utf-8?q?nc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 21:20:55 -0000
Message-ID: <174838085565.25908.17402202037591947666@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
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

--===============5703239532785924269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Panel Replay + Adaptive sync (rev2)
URL   : https://patchwork.freedesktop.org/series/149487/
State : failure

== Summary ==

CI Bug Log - changes from xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b_FULL -> xe-pw-149487v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149487v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149487v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149487v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_pm_rpm@universal-planes-dpms.html

  
New tests
---------

  New tests have been introduced between xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b_FULL and xe-pw-149487v2_FULL:

### New IGT tests (1) ###

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  

Known issues
------------

  Here are the changes found in xe-pw-149487v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#3767]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2370])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +12 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2191])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +14 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +118 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2907])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2724]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178]) +4 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#3304])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2341]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2321])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2291])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2286])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#323]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4494])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1340])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4354])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2244]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2244])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1421])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2316]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#3321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#301]) +2 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#3321]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#301]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:
    - shard-adlp:         [PASS][66] -> [FAIL][67] ([Intel XE#886]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2380]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][72] -> [DMESG-FAIL][73] ([Intel XE#4543]) +1 other test dmesg-fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][74] -> [FAIL][75] ([Intel XE#1874]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-adlp:         [PASS][76] -> [ABORT][77] ([Intel XE#2953] / [Intel XE#4925])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_force_connector_basic@force-edid.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +29 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4141]) +17 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2352])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313]) +27 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2350])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2312]) +9 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#653]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#3374] / [Intel XE#3544])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#346])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2393])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#4596])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4596])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2763]) +14 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2763]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#3309])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1489]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2387])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1406])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2414])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2330])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2413])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#4459]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#455]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2168])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1499]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#756])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#756])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#4837]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4837]) +13 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4837])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4518])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#1392]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2322]) +10 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1392])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#288]) +9 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4943]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4915]) +48 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4943]) +25 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][128] ([Intel XE#4917])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][129] ([Intel XE#4911])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2833])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2427])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][133] ([Intel XE#1173]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2284]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4650])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#4835]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@xe_pmu@gt-frequency.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4733]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#944])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#944]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4130])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4273])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][143] ([Intel XE#4543]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [SKIP][145] ([Intel XE#2351] / [Intel XE#4996]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-adlp:         [SKIP][149] ([Intel XE#4996]) -> [PASS][150] +15 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][151] ([Intel XE#2291]) -> [PASS][152] +2 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][153] ([Intel XE#2316]) -> [PASS][154] +4 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#301]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [SKIP][157] ([Intel XE#4950] / [Intel XE#4996]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][159] ([Intel XE#301]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][161] ([Intel XE#3321]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][166] +8 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#2882] / [Intel XE#886]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][169] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#886]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][173] ([Intel XE#886]) -> [PASS][174] +4 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][175] ([Intel XE#2571]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-adlp:         [SKIP][177] ([Intel XE#4962]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [SKIP][179] ([Intel XE#4950]) -> [PASS][180] +2 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_properties@crtc-properties-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_properties@crtc-properties-atomic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1392]) -> [PASS][182] +4 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][183] ([Intel XE#5018]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_intel_bb@reset-bb:
    - shard-adlp:         [SKIP][185] ([Intel XE#4945] / [Intel XE#4996]) -> [PASS][186] +3 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_intel_bb@reset-bb.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_intel_bb@reset-bb.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [SKIP][210], [PASS][211], [PASS][212]) ([Intel XE#378]) -> ([PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-4/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-9/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load@load.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][238] ([Intel XE#1794]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@munmap-style-unbind-many-all:
    - shard-adlp:         [SKIP][240] ([Intel XE#4945]) -> [PASS][241] +23 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_vm@munmap-style-unbind-many-all.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_vm@munmap-style-unbind-many-all.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         [SKIP][242] ([Intel XE#4996]) -> [SKIP][243] ([Intel XE#610])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][244] ([Intel XE#4996]) -> [SKIP][245] ([Intel XE#316])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][246] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][247] ([Intel XE#1124])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         [SKIP][248] ([Intel XE#4996]) -> [SKIP][249] ([Intel XE#367])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][250] ([Intel XE#4996]) -> [SKIP][251] ([Intel XE#2907])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][252] ([Intel XE#4996]) -> [SKIP][253] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][254] ([Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][255] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         [SKIP][256] ([Intel XE#4996]) -> [SKIP][257] ([Intel XE#373]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-adlp:         [SKIP][258] ([Intel XE#4950] / [Intel XE#4996]) -> [SKIP][259] ([Intel XE#373])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][260] ([Intel XE#4996]) -> [SKIP][261] ([Intel XE#309])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-adlp:         [SKIP][262] ([Intel XE#4996]) -> [SKIP][263] ([Intel XE#310]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-adlp:         [SKIP][264] ([Intel XE#4996]) -> [SKIP][265] ([Intel XE#455]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][266] ([Intel XE#2312]) -> [SKIP][267] ([Intel XE#2311]) +8 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][268] ([Intel XE#2351]) -> [SKIP][269] ([Intel XE#656])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][270] ([Intel XE#2311]) -> [SKIP][271] ([Intel XE#2312]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][272] ([Intel XE#2312]) -> [SKIP][273] ([Intel XE#4141]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][274] ([Intel XE#4141]) -> [SKIP][275] ([Intel XE#2312]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][276] ([Intel XE#4996]) -> [SKIP][277] ([Intel XE#651]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][278] ([Intel XE#4947]) -> [SKIP][279] ([Intel XE#656]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][280] ([Intel XE#4996]) -> [SKIP][281] ([Intel XE#656]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][282] ([Intel XE#2312]) -> [SKIP][283] ([Intel XE#2313]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-adlp:         [SKIP][284] ([Intel XE#4996]) -> [SKIP][285] ([Intel XE#653])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][286] ([Intel XE#4947]) -> [SKIP][287] ([Intel XE#653])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][288] ([Intel XE#2351]) -> [SKIP][289] ([Intel XE#653])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][290] ([Intel XE#2313]) -> [SKIP][291] ([Intel XE#2312]) +6 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         [SKIP][292] ([Intel XE#4996]) -> [SKIP][293] ([Intel XE#2007])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         [SKIP][294] ([Intel XE#4996]) -> [SKIP][295] ([Intel XE#1489])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-adlp:         [SKIP][296] ([Intel XE#4947]) -> [SKIP][297] ([Intel XE#1489])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         [SKIP][298] ([Intel XE#4996]) -> [SKIP][299] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         [SKIP][300] ([Intel XE#4996]) -> [SKIP][301] ([Intel XE#330])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][302] ([Intel XE#4945]) -> [SKIP][303] ([Intel XE#455] / [Intel XE#488])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         [SKIP][304] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][305] ([Intel XE#1126])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         [SKIP][306] ([Intel XE#4945]) -> [SKIP][307] ([Intel XE#4837]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-discovery.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         [SKIP][308] ([Intel XE#4945]) -> [SKIP][309] ([Intel XE#261] / [Intel XE#688])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_evict@evict-large-external-cm.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         [SKIP][310] ([Intel XE#4945]) -> [SKIP][311] ([Intel XE#1392])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         [SKIP][312] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][313] ([Intel XE#288])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-adlp:         [SKIP][314] ([Intel XE#4945]) -> [SKIP][315] ([Intel XE#288]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         [SKIP][316] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][317] ([Intel XE#4915]) +50 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         [SKIP][318] ([Intel XE#4945]) -> [SKIP][319] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_oa@rc6-disable.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][320] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][321] ([Intel XE#2541] / [Intel XE#3573])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         [SKIP][322] ([Intel XE#4945]) -> [SKIP][323] ([Intel XE#944])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_query@multigpu-query-cs-cycles.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_query@multigpu-query-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4925
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b -> xe-pw-149487v2

  IGT_8380: 8380
  xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b: b9431c1a990f34f061f27abd83b3fc2b06b83b0b
  xe-pw-149487v2: 149487v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/index.html

--===============5703239532785924269==
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
<tr><td><b>Series:</b></td><td>Panel Replay + Adaptive sync (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149487/">https://patchwork.freedesktop.org/series/149487/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149487v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149487v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3147-b9431c1a990f34f061f27abd83b3fc2b0=
6b83b0b_FULL -&gt; xe-pw-149487v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149487v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149487v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1494=
87v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_=
rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_pm_rpm@univers=
al-planes-dpms.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3147-b9431c1a990f34f061f27abd8=
3b3fc2b06b83b0b_FULL and xe-pw-149487v2_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149487v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-=
tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-=
after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_c=
ursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-n=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/s=
hard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vbla=
nk@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@kms_fli=
p@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fli=
p@wf_vblank-ts-check@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_flip@wf_v=
blank-ts-check@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_for=
ce_connector_basic@force-edid.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@kms_force_conn=
ector_basic@force-edid.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4925">Intel XE#4925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
14 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149487v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@kms_writeback@writeback-fb-=
id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_eudebug@vm-bind-clear-faul=
table.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v=
2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexec=
queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunma=
p-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-many-execqueues-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#494=
3</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_oa@non-system-wide-paran=
oid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_pmu@fn-engine-activity-loa=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149487v2/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835"=
>Intel XE#4835</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149487v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big=
_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149487v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-=
1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">PASS</a> +15 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-7/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg=
-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard=
-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-a=
dlp-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/sha=
rd-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
487v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2=
/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +8 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-463/igt@kms_fl=
ip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1494=
87v2/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-8/igt@kms_flip=
@wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-1/ig=
t@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-435/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible@a-dp4.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-d=
g2-435/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-8/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-1/igt@kms_fl=
ip@wf_vblank-ts-check@b-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-bmg-2/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_=
rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@=
kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pro=
perties@crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/i=
gt@kms_properties@crtc-properties-atomic.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-dg=
2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149487v2/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@reset-bb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_inte=
l_bb@reset-bb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe=
_intel_bb@reset-bb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0=
b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06=
b83b0b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3f=
c2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd=
83b3fc2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f=
27abd83b3fc2b06b83b0b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34=
f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a9=
90f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b943=
1c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147=
-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0=
b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06=
b83b0b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd83b3f=
c2b06b83b0b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f27abd=
83b3fc2b06b83b0b/shard-adlp-1/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34f061f=
27abd83b3fc2b06b83b0b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3147-b9431c1a990f34=
f061f27abd83b3fc2b06b83b0b/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149487v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1494=
87v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-a=
dlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149487v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/sh=
ard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149487v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149487v2/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487=
v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149487v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adl=
p-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49487v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shar=
d-adlp-3/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-lnl-3/igt@xe_pm@s4-vm-b=
ind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_vm@m=
unmap-style-unbind-many-all.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe=
_vm@munmap-style-unbind-many-all.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big=
_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/i=
gt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big=
_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_big=
_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shar=
d-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_bw@=
linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-=
1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard=
-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_ccs=
@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/s=
hard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE=
#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149487v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cha=
melium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-a=
dlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#=
373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cha=
melium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/sh=
ard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel=
 XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149487v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tra=
nsitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fli=
p@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1=
/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE=
#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149487v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
487v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v=
2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren=
-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2=
/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1494=
87v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-ad=
lp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149487v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149487v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_pm_=
dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr=
2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shar=
d-adlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr=
2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/i=
gt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_psr=
@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_psr@fbc=
-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@kms_tv_=
load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_ccs@=
block-multicopy-inplace.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_ccs=
@block-multicopy-inplace.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_copy=
_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard=
-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_eude=
bug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe=
_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_evic=
t@evict-large-external-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_e=
vict@evict-large-external-cm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec=
_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_=
exec_basic@multigpu-once-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefet=
ch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec=
_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">I=
ntel XE#4945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec=
_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shar=
d-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_exec=
_system_allocator@process-many-execqueues-mmap-nomemset.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_exec_system_allocator@process-ma=
ny-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +50 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_oa@r=
c6-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_oa@rc6-disable.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_oa@u=
nprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/s=
hard-adlp-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b/shard-adlp-1/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149487v2/shard-adlp-1/igt@xe_=
query@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b -&gt; xe-pw-149=
487v2</li>
</ul>
<p>IGT_8380: 8380<br />
  xe-3147-b9431c1a990f34f061f27abd83b3fc2b06b83b0b: b9431c1a990f34f061f27ab=
d83b3fc2b06b83b0b<br />
  xe-pw-149487v2: 149487v2</p>

</body>
</html>

--===============5703239532785924269==--
