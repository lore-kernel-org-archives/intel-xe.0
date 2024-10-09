Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E905CED611
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 22:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90C10E82B;
	Wed,  9 Oct 2024 22:54:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC88910E82B;
 Wed,  9 Oct 2024 22:54:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3564329412885280272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Handle_G2H_response_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 22:54:10 -0000
Message-ID: <172851445082.1212675.14348716436225114818@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
In-Reply-To: <20241009105645.1416588-1-badal.nilawar@intel.com>
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

--===============3564329412885280272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle G2H response timeout
URL   : https://patchwork.freedesktop.org/series/139770/
State : failure

== Summary ==

CI Bug Log - changes from xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a_full -> xe-pw-139770v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139770v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139770v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139770v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [ABORT][12] ([Intel XE#1694]) -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - {shard-bmg}:        [FAIL][14] ([Intel XE#2333]) -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  
Known issues
------------

  Here are the changes found in xe-pw-139770v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1465])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_3d.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#660])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#1033])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1426]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#1659])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1407]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#316]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#877])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1204])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#1231]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#610])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2191])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2191])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#367]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#367]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1512])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#787]) +97 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +63 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#787]) +95 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#2907]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#1195] / [Intel XE#1727])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#1195])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2907])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#314])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#306]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#306]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#373]) +22 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#373]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#373]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1178]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#307]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#307]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#455]) +35 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1188]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#308])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1424])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#308]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2321])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#323]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#323])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455]) +13 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#776])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#776])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1138])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1138])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1137])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1135])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1135])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1421]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#310]) +10 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#1204])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][80] -> [FAIL][81] ([Intel XE#301]) +5 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][82] ([Intel XE#2953]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [PASS][83] -> [DMESG-WARN][84] ([Intel XE#2953])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#886]) +3 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][89] ([Intel XE#324]) +3 other tests dmesg-fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#352])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +25 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#651]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#651]) +24 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656]) +81 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [PASS][95] -> [INCOMPLETE][96] ([Intel XE#2050])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1151])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +18 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653]) +23 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +14 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1341])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1339])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1503] / [Intel XE#599])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1450]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1450] / [Intel XE#599])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2927])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][108] ([Intel XE#1035] / [Intel XE#1195])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][109] ([Intel XE#2078]) +1 other test warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][110] -> [DMESG-FAIL][111] ([Intel XE#324]) +4 other tests dmesg-fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#324]) +5 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#309]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#361]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2763]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#870])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1122]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1129]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          NOTRUN -> [FAIL][120] ([Intel XE#718])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#1430])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1129])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#836]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2893])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1489]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1489]) +15 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1406]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +25 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2939])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2939])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#327]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#327]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][135] ([Intel XE#1874]) +4 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1437])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1127])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-adlp:         NOTRUN -> [FAIL][138] ([Intel XE#2883]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#2883]) +6 other tests fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][140] ([Intel XE#1174])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#362])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][142] -> [FAIL][143] ([Intel XE#899]) +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#2168])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][145] -> [FAIL][146] ([Intel XE#2159]) +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#2443]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-3/igt@kms_vrr@flip-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#756]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1447])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1447])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1123])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1123]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1126]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1126])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1062])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#2905]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2905]) +8 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2905]) +15 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#688]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][162] -> [TIMEOUT][163] ([Intel XE#1473])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#261] / [Intel XE#688]) +12 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#688]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1392]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][167] -> [FAIL][168] ([Intel XE#2754])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#288]) +49 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#288]) +21 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#2360]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#2541]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#2541]) +12 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][174] ([Intel XE#2514])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#2248])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#2838] / [Intel XE#979])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#1061])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#2284] / [Intel XE#366]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#1948])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][181] -> [ABORT][182] ([Intel XE#1358] / [Intel XE#1607])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][183] -> [ABORT][184] ([Intel XE#1358] / [Intel XE#1607])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-2/igt@xe_pm@s4-exec-after.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#579])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#944])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#944]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][188] ([Intel XE#2919])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1195]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][195] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][197] ([Intel XE#1475]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [ABORT][199] ([Intel XE#2915]) -> [PASS][200] +8 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][201] ([Intel XE#301]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][203] ([Intel XE#301]) -> [PASS][204] +4 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][205] -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][207] ([Intel XE#886]) -> [PASS][208] +10 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][209] ([Intel XE#301]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [ABORT][211] ([Intel XE#2899]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-adlp:         [DMESG-WARN][213] -> [PASS][214] +2 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][215] ([Intel XE#718]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][217] ([Intel XE#2029]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-lnl:          [DMESG-WARN][219] ([Intel XE#1620]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@kms_pm_rpm@basic-rte.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][221] ([Intel XE#2948]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - {shard-bmg}:        [ABORT][223] ([Intel XE#2915]) -> [PASS][224] +6 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][225] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][227] ([Intel XE#1473]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][229] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-8/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-lnl:          [INCOMPLETE][231] ([Intel XE#2855]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - shard-lnl:          [FAIL][233] ([Intel XE#2754]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-lnl:          [INCOMPLETE][235] -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#358]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-lnl:          [DMESG-WARN][239] -> [PASS][240] +2 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_threads@threads-cm-userptr.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - shard-lnl:          [INCOMPLETE][241] ([Intel XE#1169]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_threads@threads-mixed-fd-rebind.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-rebind.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-lnl:          [FAIL][243] -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_oa@invalid-oa-exponent.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [TIMEOUT][245] ([Intel XE#1358] / [Intel XE#1620] / [Intel XE#2574]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [ABORT][247] ([Intel XE#1358]) -> [PASS][248] +2 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
    - {shard-bmg}:        [ABORT][249] ([Intel XE#1616]) -> [PASS][250] +4 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [ABORT][251] ([Intel XE#1358] / [Intel XE#2915]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
    - shard-adlp:         [ABORT][253] ([Intel XE#1358] / [Intel XE#2915]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [TIMEOUT][255] ([Intel XE#1358] / [Intel XE#1620]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][257] ([Intel XE#1694]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
    - shard-dg2-set2:     [ABORT][259] ([Intel XE#1694]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][261] ([Intel XE#1358]) -> [PASS][262] +2 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][263] -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][265] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][267] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
    - shard-dg2-set2:     [ABORT][269] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][271] ([Intel XE#1794]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [ABORT][273] ([Intel XE#2915]) -> [PASS][274] +4 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [ABORT][275] -> [DMESG-WARN][276] ([Intel XE#1033])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][277] ([Intel XE#324]) -> [FAIL][278] ([Intel XE#1231])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [ABORT][279] ([Intel XE#2899]) -> [DMESG-WARN][280] ([Intel XE#2953])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][281] ([Intel XE#1035]) -> [INCOMPLETE][282] ([Intel XE#1035] / [Intel XE#1195])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#362]) -> [SKIP][284] ([Intel XE#1500])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2855
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a -> xe-pw-139770v1

  IGT_8061: 8061
  xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a: 80a5a3d55cc0af07a9833696969ffce346ca692a
  xe-pw-139770v1: 139770v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/index.html

--===============3564329412885280272==
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
<tr><td><b>Series:</b></td><td>Handle G2H response timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139770/">https://patchwork.freedesktop.org/series/139770/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a_full -&gt; xe-pw-139770v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139770v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139770v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139770v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s2idle-vm-bind-userptr:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139770v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-3/igt@kms_vrr@flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-1/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-6/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_evict@evict-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-464/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-2/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899">Intel XE#2899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-8/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_exec_basic@many-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2855">Intel XE#2855</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-3/igt@xe_exec_basic@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_exec_threads@threads-mixed-fd-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_oa@invalid-oa-exponent.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_oa@invalid-oa-exponent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574">Intel XE#2574</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +2 other tests pass</li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-bmg-3/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-bmg-6/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-2/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899">Intel XE#2899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139770v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a -&gt; xe-pw-139770v1</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2033-80a5a3d55cc0af07a9833696969ffce346ca692a: 80a5a3d55cc0af07a9833696969ffce346ca692a<br />
  xe-pw-139770v1: 139770v1</p>

</body>
</html>

--===============3564329412885280272==--
