Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523AACCFA04
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 10:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029CD10E1B6;
	Mon,  3 Nov 2025 10:02:34 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874F110E057;
 Mon,  3 Nov 2025 10:02:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6382059372310929274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Kconfig_updates_for_MEI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 10:02:32 -0000
Message-ID: <176216415253.10701.7616468721077279@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251029102153.419347-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251029102153.419347-1-Simon.Richter@hogyros.de>
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

--===============6382059372310929274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Kconfig updates for MEI
URL   : https://patchwork.freedesktop.org/series/156731/
State : failure

== Summary ==

CI Bug Log - changes from xe-4002-1a9600afa443248d01701fd489012edcfdc3e128_FULL -> xe-pw-156731v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156731v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156731v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156731v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_sequence@queue-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-156731v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6] ([Intel XE#6456])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2351]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#610])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#610])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1428])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +12 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +83 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#2705] / [Intel XE#4212])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2724])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2341])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2320])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x64.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2286])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4354])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2244])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2374])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#3149] / [Intel XE#5416]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][63] -> [FAIL][64] ([Intel XE#5416])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][67] -> [DMESG-WARN][68] ([Intel XE#3428]) +18 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#4543]) +4 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#455]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#6312])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6312])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +10 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#656]) +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#651]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2311]) +29 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#656]) +15 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#5390]) +12 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#651]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +29 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1158])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2350])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#6312])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2351]) +16 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1503])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#4848])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2393])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#4596])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4596])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#4596])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2763]) +14 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#6381]) +9 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2938])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2391])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1131])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3309])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1406]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1128] / [Intel XE#1406])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1406] / [Intel XE#2387]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406] / [Intel XE#4609])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#2351]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1406]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1406] / [Intel XE#2414])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1406] / [Intel XE#2939])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2330])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1127])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#3414]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][132] -> [FAIL][133] ([Intel XE#6361]) +2 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#455]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1435])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@query-busy-hang@pipe-d-dp-2:
    - shard-bmg:          [PASS][136] -> [DMESG-FAIL][137] ([Intel XE#3428]) +2 other tests dmesg-fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][138] ([Intel XE#3428]) +1 other test dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][139] -> [FAIL][140] ([Intel XE#4459]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1499])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [FAIL][143] ([Intel XE#5963])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#6360])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1126])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#5626])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#4837] / [Intel XE#5565]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4837]) +14 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4837]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4837]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#688]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#5564])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#261])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][154] -> [INCOMPLETE][155] ([Intel XE#6321])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1392]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2322]) +8 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@twice-null-defer-bind:
    - shard-adlp:         [PASS][159] -> [DMESG-WARN][160] ([Intel XE#3876])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec_basic@twice-null-defer-bind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_exec_basic@twice-null-defer-bind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:
    - shard-adlp:         [PASS][161] -> [FAIL][162] ([Intel XE#5625])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#288]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#4915]) +81 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4915]) +120 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#4943]) +18 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#6456]) +355 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#4943]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_exec_system_allocator@twice-mmap-new-huge.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#3573]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_oa@map-oa-buffer.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#977])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#1420])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1948])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][174] -> [DMESG-WARN][175] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_pm@s2idle-basic.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][176] -> [SKIP][177] ([Intel XE#6456]) +148 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#584])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [FAIL][179] ([Intel XE#6406])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         NOTRUN -> [FAIL][180] ([Intel XE#6406])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-2:
    - shard-adlp:         [PASS][181] -> [TIMEOUT][182] ([Intel XE#3876] / [Intel XE#6421]) +1 other test timeout
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_pmu@engine-activity-accuracy-2.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-2.html

  * igt@xe_pmu@engine-activity-suspend:
    - shard-adlp:         [PASS][183] -> [DMESG-WARN][184] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@xe_pmu@engine-activity-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-1/igt@xe_pmu@engine-activity-suspend.html

  * igt@xe_pmu@gt-c6-idle:
    - shard-dg2-set2:     NOTRUN -> [FAIL][185] ([Intel XE#6366])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#4733]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#4733] / [Intel XE#5594])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#4733])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#944]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#944]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#4814])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#6376])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_sriov_vram@vf-access-after-resize-up.html
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#6376])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#6456]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@core_getversion@all-cards.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#2134]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@fbdev@unaligned-read.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][198] ([Intel XE#4543]) -> [PASS][199] +5 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][200] ([Intel XE#3908]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-adlp:         [FAIL][202] ([Intel XE#5395]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#3862]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][206] ([Intel XE#3862]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_crc@cursor-size-hints:
    - shard-bmg:          [SKIP][208] ([Intel XE#2320]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_cursor_crc@cursor-size-hints.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-FAIL][210] ([Intel XE#3372] / [Intel XE#3428]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [FAIL][212] ([Intel XE#6496]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][214] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][216] ([Intel XE#5352]) -> [PASS][217] +4 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][218] ([Intel XE#3149] / [Intel XE#5352]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#6456]) -> [PASS][221] +141 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [INCOMPLETE][222] -> [PASS][223] +2 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
    - shard-lnl:          [INCOMPLETE][224] ([Intel XE#5736]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2351]) -> [PASS][227] +6 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          [FAIL][228] ([Intel XE#3106]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2:
    - shard-bmg:          [FAIL][230] -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][232] ([Intel XE#2597]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][234] ([Intel XE#6361]) -> [PASS][235] +2 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@kms_setmode@basic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-9/igt@kms_setmode@basic.html

  * igt@xe_exec_system_allocator@many-large-malloc-mlock:
    - shard-bmg:          [INCOMPLETE][236] ([Intel XE#6480]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_exec_system_allocator@many-large-malloc-mlock.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@xe_exec_system_allocator@many-large-malloc-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - shard-bmg:          [DMESG-WARN][238] ([Intel XE#3428]) -> [PASS][239] +4 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#3099]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_live_ktest@xe_dma_buf.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pmu@engine-activity-render-node-load-idle@engine-drm_xe_engine_class_render0:
    - shard-adlp:         [FAIL][242] ([Intel XE#6472]) -> [PASS][243] +5 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@xe_pmu@engine-activity-render-node-load-idle@engine-drm_xe_engine_class_render0.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pmu@engine-activity-render-node-load-idle@engine-drm_xe_engine_class_render0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [DMESG-FAIL][244] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#316]) -> [SKIP][247] ([Intel XE#2351])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#316]) -> [SKIP][249] ([Intel XE#6456]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#6456]) -> [SKIP][251] ([Intel XE#1124]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1124]) -> [SKIP][253] ([Intel XE#6456]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2351]) -> [SKIP][255] ([Intel XE#1124]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1124]) -> [SKIP][257] ([Intel XE#2351]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#6456]) -> [SKIP][259] ([Intel XE#2191])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#6456]) -> [SKIP][261] ([Intel XE#367])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#367]) -> [SKIP][263] ([Intel XE#6456]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#6456]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][267] ([Intel XE#2351]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2907]) -> [SKIP][269] ([Intel XE#6456]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2351]) -> [SKIP][271] ([Intel XE#455] / [Intel XE#787])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][272] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][273] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#6456]) -> [SKIP][275] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#306]) -> [SKIP][277] ([Intel XE#6456])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#6456]) -> [SKIP][279] ([Intel XE#373]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#373]) -> [SKIP][281] ([Intel XE#6456]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][282] ([Intel XE#2341]) -> [FAIL][283] ([Intel XE#1178])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_content_protection@atomic.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#6456]) -> [SKIP][285] ([Intel XE#307])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#307]) -> [SKIP][287] ([Intel XE#6456])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][288] ([Intel XE#1188]) -> [SKIP][289] ([Intel XE#6456])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_content_protection@uevent.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#6456]) -> [SKIP][291] ([Intel XE#308])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#308]) -> [SKIP][293] ([Intel XE#6456])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#6456]) -> [SKIP][295] ([Intel XE#4331])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#4422]) -> [SKIP][297] ([Intel XE#6456])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#6456]) -> [SKIP][299] ([Intel XE#776])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fbcon_fbt@psr.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#703]) -> [SKIP][301] ([Intel XE#6456])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#6456]) -> [SKIP][303] ([Intel XE#1138])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#6456]) -> [SKIP][305] ([Intel XE#1137])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#455]) -> [SKIP][307] ([Intel XE#2351]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#6312]) -> [SKIP][309] ([Intel XE#6456]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#6456]) -> [SKIP][311] ([Intel XE#651]) +13 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][312] ([Intel XE#2311]) -> [SKIP][313] ([Intel XE#2312]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#651]) -> [SKIP][315] ([Intel XE#6456]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#658]) -> [SKIP][317] ([Intel XE#2351])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#6456]) -> [SKIP][319] ([Intel XE#6312]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][320] ([Intel XE#2312]) -> [SKIP][321] ([Intel XE#2311])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#651]) -> [SKIP][323] ([Intel XE#2351]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][324] ([Intel XE#2313]) -> [SKIP][325] ([Intel XE#2312]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#653]) -> [SKIP][327] ([Intel XE#2351]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][328] ([Intel XE#2312]) -> [SKIP][329] ([Intel XE#2313]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#6456]) -> [SKIP][331] ([Intel XE#653]) +5 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2351]) -> [SKIP][333] ([Intel XE#653]) +6 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#653]) -> [SKIP][335] ([Intel XE#6456]) +11 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#6456]) -> [SKIP][337] ([Intel XE#455]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_panel_fitting@legacy.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#455]) -> [SKIP][339] ([Intel XE#6456]) +6 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_plane_lowres@tiling-y.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#6456]) -> [SKIP][341] ([Intel XE#5020])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#6456]) -> [SKIP][343] ([Intel XE#870])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#6456]) -> [SKIP][345] ([Intel XE#3309])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#908]) -> [SKIP][347] ([Intel XE#6456])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#1406]) -> [SKIP][349] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][351] ([Intel XE#1406]) +4 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1406] / [Intel XE#2351]) -> [SKIP][353] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1406]) -> [SKIP][355] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][357] ([Intel XE#1406]) +7 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@kms_psr@psr2-dpms.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#6456]) -> [SKIP][359] ([Intel XE#3414]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1127]) -> [SKIP][361] ([Intel XE#6456])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][362] ([Intel XE#2426]) -> [SKIP][363] ([Intel XE#2509])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#1500]) -> [SKIP][365] ([Intel XE#6456])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#6456]) -> [SKIP][367] ([Intel XE#330])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#6456]) -> [SKIP][369] ([Intel XE#6010])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_configfs@survivability-mode.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-matrix-copy-200x127:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#5300]) -> [SKIP][371] ([Intel XE#6456])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_copy_basic@mem-matrix-copy-200x127.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_copy_basic@mem-matrix-copy-200x127.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#4837]) -> [SKIP][373] ([Intel XE#6456]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#6456]) -> [SKIP][375] ([Intel XE#4837]) +4 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#6456]) -> [SKIP][377] ([Intel XE#4518])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_eudebug_sriov@deny-eudebug.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#4518]) -> [SKIP][379] ([Intel XE#6456])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#288]) -> [SKIP][381] ([Intel XE#6456]) +13 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#6456]) -> [SKIP][383] ([Intel XE#288]) +11 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-WARN][384] ([Intel XE#3868]) -> [DMESG-FAIL][385] ([Intel XE#3868])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#6456]) -> [SKIP][387] ([Intel XE#4915]) +154 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#4915]) -> [SKIP][389] ([Intel XE#6456]) +164 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][390] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][391] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][392] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][393] ([Intel XE#5466] / [Intel XE#5530])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#6456]) -> [SKIP][395] ([Intel XE#255])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [SKIP][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419]) ([Intel XE#2457]) -> ([PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [DMESG-WARN][437], [PASS][438], [PASS][439], [SKIP][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445]) ([Intel XE#2457] / [Intel XE#3428])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-1/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-1/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-1/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-3/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-3/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-3/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#6456]) -> [SKIP][447] ([Intel XE#6032])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@buffer-size.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#6032]) -> [SKIP][449] ([Intel XE#6456])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_oa@mmio-triggered-reports-read.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#6456]) -> [SKIP][451] ([Intel XE#6377])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@non-zero-reason-all.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#3573]) -> [SKIP][453] ([Intel XE#6456]) +3 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#6456]) -> [SKIP][455] ([Intel XE#3573]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#6456]) -> [SKIP][457] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#2284]) -> [SKIP][459] ([Intel XE#6456])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#4650]) -> [SKIP][461] ([Intel XE#6456])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_pmu@fn-engine-activity-load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#4733]) -> [SKIP][463] ([Intel XE#6456]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#6456]) -> [SKIP][465] ([Intel XE#4733])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#6456]) -> [SKIP][467] ([Intel XE#944])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#944]) -> [SKIP][469] ([Intel XE#6456]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#4814]) -> [SKIP][471] ([Intel XE#6456])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_render_copy@render-stress-4-copies.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#4130]) -> [SKIP][473] ([Intel XE#6456])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#6456]) -> [SKIP][475] ([Intel XE#4351])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#6318]) -> [SKIP][477] ([Intel XE#6456])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_sriov_vram@vf-access-provisioned.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_sriov_vram@vf-access-provisioned.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3372
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4848
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5395
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5736
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6377
  [Intel XE#6381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6381
  [Intel XE#6406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406
  [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
  [Intel XE#6456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456
  [Intel XE#6472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6472
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6496
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-4002-1a9600afa443248d01701fd489012edcfdc3e128 -> xe-pw-156731v1

  IGT_8600: 8600
  xe-4002-1a9600afa443248d01701fd489012edcfdc3e128: 1a9600afa443248d01701fd489012edcfdc3e128
  xe-pw-156731v1: 156731v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/index.html

--===============6382059372310929274==
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
<tr><td><b>Series:</b></td><td>Kconfig updates for MEI</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156731/">https://patchwork.freedesktop.org/series/156731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-156731v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156731v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4002-1a9600afa443248d01701fd489012edcf=
dc3e128_FULL -&gt; xe-pw-156731v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156731v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-156731v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1567=
31v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_curs=
or_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_cursor_ed=
ge_walk@256x256-right-edge.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-=
6/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">FAIL=
</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_sequence@queue-idle.html"=
>FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156731v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@core_setmaster@master-drop-=
set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-6/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_bi=
g_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@km=
s_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-ti=
led-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg=
2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">In=
tel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cm=
p-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_cursor_crc@cur=
sor-random-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-=
vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_flip=
@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_=
flip@2x-modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel =
XE#5416</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_flip=
@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5416">Intel XE#5416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@d-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_flip@flip-v=
s-expired-vblank@d-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +18 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@km=
s_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plan=
e_alpha_blend@alpha-transparent-fb.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_=
alpha_blend@alpha-transparent-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4848">Intel XE#4848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_plane_scal=
ing@planes-upscale-20x20.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6381">Intel XE#6381</a>) +9 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr@pr-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">I=
ntel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_psr@psr2-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@kms_setm=
ode@basic@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@kms_setmode@basic@p=
ipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@kms_vbla=
nk@query-busy-hang@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_vblank@que=
ry-busy-hang@pipe-d-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +2 other tests =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@kms_vblank@ts-continuation-su=
spend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-lnl-4/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-156731v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_compute@ccs-mode-compute-k=
ernel.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5963">Intel XE#5963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt-many-all-ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_eu_stall@unprivileged-ac=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5565">Intel XE#5565</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-464/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-thread=
s-small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_evict@evict-beng-large-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_evict@evict-beng-threads-=
large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other test sk=
ip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec=
_basic@twice-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_exec_basic@t=
wice-null-defer-bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec=
_compute_mode@many-execqueues-bindexecqueue-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp=
-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">=
Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_fault_mode@many-exec=
queues-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_exec_system_allocator@man=
y-large-mmap-shared-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +81 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-share=
d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-execqueues-mmap-prefetch-shared.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +12=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +355=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_exec_system_allocator@twic=
e-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_oa@map-oa-buffer.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/295=
3">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_pm@=
s2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pm@s2idle-exec-after.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6456">Intel XE#6456</a>) +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6406">Intel XE#6406</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6406">Intel XE#6406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_pmu@=
engine-activity-accuracy-2.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_pmu@engine-act=
ivity-accuracy-2.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3876">Intel XE#3876</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6421">Intel XE#6421</a>) +1 other tes=
t timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@xe_pmu@=
engine-activity-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-1/igt@xe_pmu@engine-activi=
ty-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366"=
>Intel XE#6366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-=
fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-dg2-466/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@xe_sriov_vram@vf-access-after=
-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6376">Intel XE#6376</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_sriov_vram@vf-access-afte=
r-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@core_g=
etversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@core_getv=
ersion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@fbdev@=
unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@fbdev@unaligne=
d-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-156731v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c=
-hdmi-a-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1567=
31v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@kms_big=
_fb@linear-32bpp-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5395">Intel XE#5395</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@km=
s_big_fb@linear-32bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-156731v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_curs=
or_crc@cursor-size-hints.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_cu=
rsor_crc@cursor-size-hints.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3372">Intel XE#3372</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6496">Intel XE#6496</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/i=
gt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@kms_fbc=
on_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-ad=
lp-9/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_flip=
@2x-blocking-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Inte=
l XE#5352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-156731v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-inter=
ruptible@bc-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_flip=
@2x-blocking-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Inte=
l XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5352">Intel XE#5352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_flip@2x-blocking-absolute-w=
f_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt=
@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +141 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@kms_flip@flip-vs-sus=
pend.html">PASS</a> +2 other tests pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-lnl-7/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5736">Intel XE#5736</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-lnl-8/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-156731v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_pipe=
_crc_basic@disable-crc-after-crtc.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/i=
gt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_pipe=
_crc_basic@disable-crc-after-crtc@pipe-a-dp-2.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/ig=
t@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-434/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1567=
31v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-9/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-9/igt@kms_setmode@basic.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_exec_=
system_allocator@many-large-malloc-mlock.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/=
shard-bmg-7/igt@xe_exec_system_allocator@many-large-malloc-mlock.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428"=
>Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-=
vm-many-mmap-mlock-nomemset.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_liv=
e_ktest@xe_dma_buf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_live_kt=
est@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-render-node-load-idle@engine-drm_xe_engine_cl=
ass_render0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@xe_pmu@=
engine-activity-render-node-load-idle@engine-drm_xe_engine_class_render0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6472">Intel XE#6472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_pmu@engine-activity-render-no=
de-load-idle@engine-drm_xe_engine_class_render0.html">PASS</a> +5 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-4/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel X=
E#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-2/igt@xe_sriov_scheduling=
@nonpreempt-engine-resets@numvfs-random.html">PASS</a> +1 other test pass</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@km=
s_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_bi=
g_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@km=
s_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shar=
d-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">In=
tel XE#6456</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1567=
31v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156731v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/=
shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-=
436/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-46=
3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/=
shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Inte=
l XE#6456</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731=
v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Inte=
l XE#6456</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/=
igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-=
435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ch=
amelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_c=
hamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_chamel=
ium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6456">Intel XE#6456</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-43=
6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@=
kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_c=
ontent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/=
igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt=
@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_dp=
_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/=
igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/=
shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@km=
s_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-156731v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32=
bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#=
6312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6456">Intel XE#6456</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1567=
31v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731=
v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6456">Intel XE#6456</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt=
@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Int=
el XE#6456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscr=
een-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-156731v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn=
-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-156731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
731v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/sh=
ard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
>Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-43=
6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pa=
nel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms_panel_=
fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_pl=
ane_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_plane_l=
owres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6456">Intel XE#6456</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pl=
ane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_pla=
ne_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel =
XE#1406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-156731v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#=
1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156731v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Inte=
l XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@kms=
_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#=
929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@kms_ps=
r@psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2=
-463/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_rot=
ation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-=
dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel =
XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/64=
56">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@kms_=
tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_c=
onfigfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-matrix-copy-200x127:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_cop=
y_basic@mem-matrix-copy-200x127.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5300">Intel XE#5300</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/=
igt@xe_copy_basic@mem-matrix-copy-200x127.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg=
2-463/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6=
456</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_eud=
ebug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_eu=
debug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Inte=
l XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-156731v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-i=
nvalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_exe=
c_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-1/igt@xe_exec=
_reset@cm-cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-adlp-8/igt@xe_e=
xec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_exe=
c_system_allocator@many-64k-mmap-mlock-nomemset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-dg2-435/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4915">Intel XE#4915</a>) +154 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_exe=
c_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/s=
hard-dg2-463/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/64=
56">Intel XE#6456</a>) +164 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-adlp-3/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Int=
el XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156731v1/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct=
_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_huc_copy@hu=
c_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3=
e128/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edc=
fdc3e128/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd48901=
2edcfdc3e128/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd4=
89012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d0170=
1fd489012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443248d=
01701fd489012edcfdc3e128/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600afa443=
248d01701fd489012edcfdc3e128/shard-bmg-3/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a9600af=
a443248d01701fd489012edcfdc3e128/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-1a96=
00afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4002-=
1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-156731v1/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-156731v1/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-156731v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-156731v1/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1=
/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-156731v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bm=
g-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
6731v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-156731v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6032">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_oa@=
mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6032">Intel XE#6032</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@x=
e_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@=
non-zero-reason-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_oa@non=
-zero-reason-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6377">Intel XE#6377</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg=
2-436/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3=
573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_pm@=
d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@xe_pm@d3co=
ld-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-436/igt@xe_pxp=
@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/=
igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_pxp=
@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-436/igt@x=
e_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-435/igt@xe_=
query@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_que=
ry@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard=
-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">In=
tel XE#6456</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_ren=
der_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/=
igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2=
-463/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#645=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-463/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg=
2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4=
351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4002-1a9600afa443248d01701fd489012edcfdc3e128/shard-dg2-432/igt@xe_sri=
ov_vram@vf-access-provisioned.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6318">Intel XE#6318</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156731v1/shard-dg2-463/igt=
@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6456">Intel XE#6456</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4002-1a9600afa443248d01701fd489012edcfdc3e128 -&gt; xe-pw-156=
731v1</li>
</ul>
<p>IGT_8600: 8600<br />
  xe-4002-1a9600afa443248d01701fd489012edcfdc3e128: 1a9600afa443248d01701fd=
489012edcfdc3e128<br />
  xe-pw-156731v1: 156731v1</p>

</body>
</html>

--===============6382059372310929274==--
