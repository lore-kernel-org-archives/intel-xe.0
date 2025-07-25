Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595B3C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 14:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4B10E44D;
	Fri, 25 Jul 2025 14:26:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEE010E451;
 Fri, 25 Jul 2025 14:26:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8088661795488986771=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_remapped_fb_view_test_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 14:26:39 -0000
Message-ID: <175345359971.189847.277307597061389701@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
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

--===============8088661795488986771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: remapped fb view test (rev3)
URL   : https://patchwork.freedesktop.org/series/152114/
State : failure

== Summary ==

CI Bug Log - changes from xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107_FULL -> xe-pw-152114v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152114v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152114v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152114v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][1] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +145 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][5] ([Intel XE#4543]) -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y.html

  
Known issues
------------

  Here are the changes found in xe-pw-152114v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - shard-adlp:         [PASS][7] -> [SKIP][8] ([Intel XE#4950]) +10 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3884]) +6 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_async_flips@crc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#4626]) +11 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#4677]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [PASS][16] -> [SKIP][17] ([Intel XE#2351] / [Intel XE#4947])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][20] -> [SKIP][21] ([Intel XE#4947]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#4543])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +97 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3862])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2724])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4416]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2321]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-bmg:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#3428])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@kms_cursor_edge_walk@64x64-top-bottom.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][41] ([Intel XE#3428])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2291])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2291]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4494] / [i915#3804])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#5633]) +5 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1137])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2316]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2316]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#4543]) +7 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#301]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#3106]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#1874])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#5390])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2311]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2312]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#1503])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#616]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2393])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][73] -> [DMESG-FAIL][74] ([Intel XE#4626] / [Intel XE#5175])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2594])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2763]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][78] -> [DMESG-WARN][79] ([Intel XE#3428] / [Intel XE#5215])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1489]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1489])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1122])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#4689]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2413])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#4837]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4837]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2322]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#1392]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#288]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4943]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4915]) +36 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#3428])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][100] -> [ABORT][101] ([Intel XE#5087])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-435/igt@xe_module_load@reload-no-display.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3573]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2284] / [Intel XE#366])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][104] -> [INCOMPLETE][105] ([Intel XE#569])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4733])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#944])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-adlp:         [PASS][108] -> [SKIP][109] ([Intel XE#4945]) +10 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][110] ([Intel XE#4543]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][112] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][118] ([Intel XE#2291]) -> [PASS][119] +2 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][120] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][121] +2 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][122] ([Intel XE#2316]) -> [PASS][123] +4 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#4543]) -> [PASS][125] +8 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][126] ([Intel XE#301]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][128] ([Intel XE#1874]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][130] ([Intel XE#2883]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_setmode@basic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][132] ([Intel XE#2883]) -> [PASS][133] +2 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1392]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][136] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#569]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][138] ([Intel XE#316]) -> [SKIP][139] ([Intel XE#4947])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][140] ([Intel XE#1124]) -> [SKIP][141] ([Intel XE#4947])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][142] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#4947]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][145] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][146] ([Intel XE#373]) -> [SKIP][147] ([Intel XE#4950])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         [SKIP][148] ([Intel XE#307]) -> [SKIP][149] ([Intel XE#4950])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][150] ([Intel XE#1178]) -> [SKIP][151] ([Intel XE#2341])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_content_protection@legacy.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][152] ([Intel XE#1188]) -> [SKIP][153] ([Intel XE#2341])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-7/igt@kms_content_protection@uevent.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-adlp:         [SKIP][154] ([Intel XE#455]) -> [SKIP][155] ([Intel XE#4950])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_cursor_crc@cursor-random-32x10.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         [SKIP][156] ([Intel XE#310]) -> [SKIP][157] ([Intel XE#4950]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip@2x-plain-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][158] ([Intel XE#301]) -> [FAIL][159] ([Intel XE#301] / [Intel XE#3149])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#5208]) -> [DMESG-WARN][161] ([Intel XE#4543] / [Intel XE#5208])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-adlp:         [SKIP][162] ([Intel XE#455]) -> [SKIP][163] ([Intel XE#4947])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][164] ([Intel XE#1874]) -> [DMESG-FAIL][165] ([Intel XE#4543])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][166] ([Intel XE#2311]) -> [SKIP][167] ([Intel XE#2312]) +8 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#2311]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][170] ([Intel XE#656]) -> [SKIP][171] ([Intel XE#4947]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][172] ([Intel XE#5390]) -> [SKIP][173] ([Intel XE#2312]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][174] ([Intel XE#656]) -> [SKIP][175] ([Intel XE#2351] / [Intel XE#4947])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#2312]) -> [SKIP][177] ([Intel XE#5390]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][178] ([Intel XE#653]) -> [SKIP][179] ([Intel XE#4947]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#2313]) +7 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][184] ([Intel XE#3544]) -> [SKIP][185] ([Intel XE#3374] / [Intel XE#3544])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         [SKIP][186] ([Intel XE#1489]) -> [SKIP][187] ([Intel XE#4947])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-adlp:         [SKIP][188] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][189] ([Intel XE#2351] / [Intel XE#4947])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr@psr-primary-page-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         [SKIP][190] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][191] ([Intel XE#4947])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][192] ([Intel XE#2426]) -> [FAIL][193] ([Intel XE#1729])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#362]) -> [SKIP][195] ([Intel XE#1500])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         [SKIP][196] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) -> [SKIP][197] ([Intel XE#4945])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-adlp:         [SKIP][198] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][199] ([Intel XE#4945])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         [SKIP][200] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][201] ([Intel XE#4945]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][202] ([Intel XE#1392] / [Intel XE#5575]) -> [SKIP][203] ([Intel XE#4945])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-bmg:          [SKIP][204] ([Intel XE#2322]) -> [INCOMPLETE][205] ([Intel XE#2594])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][206] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][207] ([Intel XE#4945]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - shard-adlp:         [SKIP][208] ([Intel XE#4915] / [Intel XE#5560]) -> [SKIP][209] ([Intel XE#4945]) +20 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html

  * igt@xe_oa@oa-exponents:
    - shard-adlp:         [SKIP][210] ([Intel XE#3573]) -> [SKIP][211] ([Intel XE#4945])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_oa@oa-exponents.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         [SKIP][212] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][213] ([Intel XE#4945])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-adlp:         [SKIP][214] ([Intel XE#944]) -> [SKIP][215] ([Intel XE#4945])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_query@multigpu-query-pxp-status.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5215
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5633
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107 -> xe-pw-152114v3

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107: 9496b813b729fc1c22cbdc7cfb7a922915582107
  xe-pw-152114v3: 152114v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/index.html

--===============8088661795488986771==
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
<tr><td><b>Series:</b></td><td>remapped fb view test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152114/">https://patchwork.freedesktop.org/series/152114/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107_FULL -&gt; xe-pw-152114v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152114v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152114v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152114v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">FAIL</a> +145 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152114v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677">Intel XE#4677</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@kms_cursor_edge_walk@64x64-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-d-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@xbgr16161616f-4tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5633">Intel XE#5633</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5215">Intel XE#5215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-435/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-463/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-1/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-3/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_oa@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_oa@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107/shard-adlp-4/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152114v3/shard-adlp-6/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107 -&gt; xe-pw-152114v3</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3475-9496b813b729fc1c22cbdc7cfb7a922915582107: 9496b813b729fc1c22cbdc7cfb7a922915582107<br />
  xe-pw-152114v3: 152114v3</p>

</body>
</html>

--===============8088661795488986771==--
