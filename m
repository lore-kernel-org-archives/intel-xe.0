Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87287D7495E
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 07:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089810E1A5;
	Wed, 30 Oct 2024 07:13:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9049D10E1A5;
 Wed, 30 Oct 2024 07:13:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2697939562840791626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/hdcp=3A_Add_the_loop_o?=
 =?utf-8?q?nly_for_DP_encoders_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 07:13:35 -0000
Message-ID: <173027241555.1362985.9945529711939909478@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030025304.317977-1-suraj.kandpal@intel.com>
In-Reply-To: <20241030025304.317977-1-suraj.kandpal@intel.com>
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

--===============2697939562840791626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Add the loop only for DP encoders (rev2)
URL   : https://patchwork.freedesktop.org/series/140632/
State : failure

== Summary ==

CI Bug Log - changes from xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f_full -> xe-pw-140632v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140632v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140632v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140632v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_pm_rpm@legacy-planes@plane-59:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-59.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes@plane-59.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][11] ([Intel XE#1124]) -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][15] ([Intel XE#2887]) -> [SKIP][16] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][17] ([Intel XE#2380]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][19] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][21] ([Intel XE#2333]) -> [SKIP][22] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][23] ([Intel XE#2311]) -> [SKIP][24] +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][25] ([Intel XE#2313]) -> [SKIP][26] +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][27] ([Intel XE#2934]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][29] ([Intel XE#2499]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][31] ([Intel XE#1489]) -> [SKIP][32] +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][33] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][34] +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][35] ([Intel XE#1130]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  
Known issues
------------

  Here are the changes found in xe-pw-140632v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#3130])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2134])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@fbdev@info.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][41] -> [DMESG-FAIL][42] ([Intel XE#1033] / [Intel XE#1727])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2890]) +15 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#877])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#316]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#1874])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1124]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#2191])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2191])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#367]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#787]) +62 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2907])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][57] ([Intel XE#1195] / [Intel XE#3113])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1195])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][60] -> [DMESG-WARN][61] ([Intel XE#3113])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#314])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#306]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#306])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#373]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#373]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#1178])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#307])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][69] ([Intel XE#1188])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#308]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-adlp:         [PASS][71] -> [TIMEOUT][72] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests timeout
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][73] -> [DMESG-WARN][74] ([Intel XE#877]) +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#323])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#776])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#701])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#701])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#703])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1138])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1135])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#301]) +3 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#301]) +7 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#3267])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2423]) +124 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#886]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#455]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#651]) +27 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#656])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +23 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#2333])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1158])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2927])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2927])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#346])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [PASS][103] -> [ABORT][104] ([Intel XE#1035] / [Intel XE#2625]) +1 other test abort
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +15 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2763]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#870])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#2029])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#3184]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#2446]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1489]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1122])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2948]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-render@edp-1:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#2808]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_psr@psr-cursor-render@edp-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@kms_psr@psr-cursor-render@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2939])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#327]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1127]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1126])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#2667])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2905])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2905]) +12 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][131] -> [TIMEOUT][132] ([Intel XE#1473] / [Intel XE#402])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][134] ([Intel XE#1473]) +1 other test timeout
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][135] -> [TIMEOUT][136] ([Intel XE#1473] / [Intel XE#2472])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][137] -> [TIMEOUT][138] ([Intel XE#1473]) +1 other test timeout
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1392])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#3160]) +3 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +23 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#255])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [PASS][144] -> [INCOMPLETE][145] ([Intel XE#2998]) +1 other test incomplete
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#378])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][147] -> [FAIL][148] ([Intel XE#2136]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2541])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2541]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2284] / [Intel XE#366])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2284])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [PASS][153] -> [ABORT][154] ([Intel XE#1358])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@xe_pm@s3-exec-after.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][155] -> [DMESG-WARN][156] ([Intel XE#2953] / [Intel XE#3086])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#944]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][158] -> [SKIP][159] ([Intel XE#1130]) +249 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@xe_spin_batch@spin-all.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][160] ([Intel XE#1885]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][162] -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][164] ([Intel XE#2134]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@fbdev@eof.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@fbdev@eof.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-adlp:         [TIMEOUT][166] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_addfb_basic@unused-modifier.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][170] ([Intel XE#1701]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][172] ([Intel XE#1426]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][174] -> [PASS][175] +5 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][176] ([Intel XE#2890]) -> [PASS][177] +18 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][178] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][182] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][184] ([Intel XE#3113]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][186] ([Intel XE#1195]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#3086]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [FAIL][190] ([Intel XE#1475]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][192] ([Intel XE#1541]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [DMESG-WARN][194] ([Intel XE#3184]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_cursor_legacy@torture-bo.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_cursor_legacy@torture-bo@pipe-c:
    - shard-dg2-set2:     [DMESG-WARN][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-c.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-c.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][198] ([Intel XE#301]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#301]) -> [PASS][201] +19 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][202] ([Intel XE#3267]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][204] ([Intel XE#2423]) -> [PASS][205] +122 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][206] ([Intel XE#886]) -> [PASS][207] +7 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][208] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [ABORT][210] ([Intel XE#2625]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][212] ([Intel XE#616]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][214] ([Intel XE#718]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [DMESG-WARN][216] ([Intel XE#3184]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-50:
    - shard-lnl:          [DMESG-WARN][218] -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [FAIL][220] ([Intel XE#2948]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [DMESG-WARN][222] ([Intel XE#2055]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-180.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][224] ([Intel XE#2159]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][226] ([Intel XE#1600]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][228] ([Intel XE#1473]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-null-defer-mmap:
    - shard-adlp:         [TIMEOUT][230] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#2981]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@xe_exec_basic@many-null-defer-mmap.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_exec_basic@many-null-defer-mmap.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [FAIL][232] ([Intel XE#2754]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][234] ([Intel XE#1130]) -> [PASS][235] +239 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-bmg:          [SKIP][236] ([Intel XE#2229]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][238] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [ABORT][240] ([Intel XE#1794]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_pm@s4-mocs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][242] ([Intel XE#2423]) -> [SKIP][243] ([Intel XE#2233])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#3194]) -> [DMESG-FAIL][245] ([Intel XE#1033] / [Intel XE#1727])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][246] ([Intel XE#2423]) -> [SKIP][247] ([Intel XE#2370])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][248] ([Intel XE#2327]) -> [SKIP][249] ([Intel XE#2890]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][250] -> [SKIP][251] ([Intel XE#2327]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][252] ([Intel XE#2890]) -> [SKIP][253] ([Intel XE#2327])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][254] ([Intel XE#2890]) -> [SKIP][255] ([Intel XE#1124]) +9 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][256] ([Intel XE#1124]) -> [SKIP][257] ([Intel XE#2890]) +9 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][258] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][259] ([Intel XE#1874])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][260] ([Intel XE#2328]) -> [SKIP][261] ([Intel XE#2890])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][262] ([Intel XE#610]) -> [SKIP][263] ([Intel XE#2890])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][264] -> [SKIP][265] ([Intel XE#1124]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][266] ([Intel XE#3194]) -> [FAIL][267] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][268] ([Intel XE#1231] / [Intel XE#1242]) -> [TIMEOUT][269] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][270] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][271] ([Intel XE#3194]) +1 other test dmesg-fail
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][272] ([Intel XE#607]) -> [SKIP][273] ([Intel XE#2890])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][274] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][275] ([Intel XE#2423]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][276] ([Intel XE#367]) -> [SKIP][277] ([Intel XE#2423]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][278] ([Intel XE#2423]) -> [SKIP][279] ([Intel XE#367]) +5 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][280] -> [SKIP][281] ([Intel XE#2887]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][282] ([Intel XE#2887]) -> [SKIP][283] ([Intel XE#2890]) +15 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][284] ([Intel XE#2890]) -> [SKIP][285] ([Intel XE#2887]) +16 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][286] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][287] ([Intel XE#2890]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][288] ([Intel XE#2890]) -> [SKIP][289] ([Intel XE#2724]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][290] ([Intel XE#2325]) -> [SKIP][291] ([Intel XE#2423]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][292] ([Intel XE#2423]) -> [SKIP][293] ([Intel XE#2252]) +14 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][294] ([Intel XE#2252]) -> [SKIP][295] ([Intel XE#2423]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][296] ([Intel XE#2423]) -> [FAIL][297] ([Intel XE#1178])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][298] ([Intel XE#2341]) -> [SKIP][299] ([Intel XE#2423]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][300] ([Intel XE#2423]) -> [SKIP][301] ([Intel XE#2390]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][302] ([Intel XE#1178]) -> [SKIP][303] ([Intel XE#2423])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [FAIL][305] ([Intel XE#1188])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@uevent.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][306] ([Intel XE#2320]) -> [SKIP][307] ([Intel XE#2423]) +7 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][308] ([Intel XE#2321]) -> [SKIP][309] ([Intel XE#2423])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][310] ([Intel XE#2423]) -> [SKIP][311] ([Intel XE#2320]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][312] ([Intel XE#2423]) -> [SKIP][313] ([Intel XE#2321]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][314] ([Intel XE#2286]) -> [SKIP][315] ([Intel XE#2423]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         [TIMEOUT][316] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][317] ([Intel XE#309])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][318] ([Intel XE#2890]) -> [SKIP][319] ([Intel XE#1508])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][320] ([Intel XE#2890]) -> [SKIP][321] ([Intel XE#2244]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][322] ([Intel XE#2244]) -> [SKIP][323] ([Intel XE#2890]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][324] ([Intel XE#2890]) -> [SKIP][325] ([Intel XE#776])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][326] ([Intel XE#2372]) -> [SKIP][327] ([Intel XE#2423])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][328] ([Intel XE#2423]) -> [SKIP][329] ([Intel XE#2373])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][330] ([Intel XE#2423]) -> [SKIP][331] ([Intel XE#1138])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][332] ([Intel XE#2374]) -> [SKIP][333] ([Intel XE#2423])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_feature_discovery@psr1.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][334] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][335] ([Intel XE#2890]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][336] -> [SKIP][337] ([Intel XE#2293] / [Intel XE#2380])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][338] ([Intel XE#2890]) -> [SKIP][339] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][340] -> [SKIP][341] ([Intel XE#2311]) +11 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2311]) -> [SKIP][343] ([Intel XE#2890]) +33 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#2890]) -> [SKIP][345] ([Intel XE#2311]) +27 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][346] ([Intel XE#2333]) -> [SKIP][347] ([Intel XE#2890]) +20 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][348] ([Intel XE#2890]) -> [FAIL][349] ([Intel XE#2333]) +10 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-bmg:          [SKIP][350] -> [FAIL][351] ([Intel XE#2333]) +4 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][352] ([Intel XE#2313]) -> [SKIP][353] ([Intel XE#2890]) +35 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][354] ([Intel XE#2352]) -> [SKIP][355] ([Intel XE#2890])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][356] -> [SKIP][357] ([Intel XE#2350])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][358] ([Intel XE#2890]) -> [SKIP][359] ([Intel XE#2313]) +30 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][360] -> [SKIP][361] ([Intel XE#2313]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][362] ([Intel XE#2340]) -> [SKIP][363] ([Intel XE#2423])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-adlp:         [SKIP][364] ([Intel XE#455]) -> [TIMEOUT][365] ([Intel XE#1033] / [Intel XE#1727])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_hdr@bpc-switch-dpms.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][366] ([Intel XE#2927]) -> [SKIP][367] ([Intel XE#2890])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][368] -> [SKIP][369] ([Intel XE#346])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][370] ([Intel XE#2934]) -> [SKIP][371] ([Intel XE#2890])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][372] ([Intel XE#2486]) -> [SKIP][373] ([Intel XE#2423])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_panel_fitting@legacy.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][374] ([Intel XE#2393]) -> [SKIP][375] ([Intel XE#2423])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][376] ([Intel XE#2493]) -> [SKIP][377] ([Intel XE#2423])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][378] ([Intel XE#2763]) -> [SKIP][379] ([Intel XE#2423]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][380] ([Intel XE#2423]) -> [SKIP][381] ([Intel XE#2763]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][382] ([Intel XE#2890]) -> [SKIP][383] ([Intel XE#2938])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][384] ([Intel XE#2890]) -> [SKIP][385] ([Intel XE#870]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][386] ([Intel XE#2890]) -> [SKIP][387] ([Intel XE#2391])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][388] ([Intel XE#2392]) -> [SKIP][389] ([Intel XE#2890])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][390] ([Intel XE#2890]) -> [SKIP][391] ([Intel XE#2392])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][392] ([Intel XE#2505]) -> [SKIP][393] ([Intel XE#2890])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][394] ([Intel XE#2446]) -> [SKIP][395] ([Intel XE#1439] / [Intel XE#3141]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][396] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][397] ([Intel XE#2446])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][398] ([Intel XE#1489]) -> [SKIP][399] ([Intel XE#2890])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][400] -> [SKIP][401] ([Intel XE#1489]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][402] ([Intel XE#2890]) -> [SKIP][403] ([Intel XE#1489]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][404] ([Intel XE#2890]) -> [SKIP][405] ([Intel XE#2387])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][406] ([Intel XE#2387]) -> [SKIP][407] ([Intel XE#2890])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][408] ([Intel XE#2890]) -> [SKIP][409] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][410] -> [SKIP][411] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr@pr-suspend.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][412] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][413] ([Intel XE#2890]) +15 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][414] ([Intel XE#2329]) -> [SKIP][415] ([Intel XE#2423]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][416] ([Intel XE#2330]) -> [SKIP][417] ([Intel XE#2423]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][418] ([Intel XE#2423]) -> [SKIP][419] ([Intel XE#2329]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][420] ([Intel XE#2413]) -> [SKIP][421] ([Intel XE#2423]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][422] ([Intel XE#2423]) -> [SKIP][423] ([Intel XE#2413]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][424] ([Intel XE#2426]) -> [FAIL][425] ([Intel XE#1729])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][426] ([Intel XE#2423]) -> [SKIP][427] ([Intel XE#2426])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][428] ([Intel XE#2423]) -> [SKIP][429] ([Intel XE#2168])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_vrr@cmrr.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][430] ([Intel XE#1499]) -> [SKIP][431] ([Intel XE#2423]) +3 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][432] ([Intel XE#2423]) -> [SKIP][433] ([Intel XE#1499])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][434] ([Intel XE#2423]) -> [SKIP][435] ([Intel XE#756])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_writeback@writeback-fb-id.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][436] ([Intel XE#756]) -> [SKIP][437] ([Intel XE#2423])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][438] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][439] ([Intel XE#2423])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][440] ([Intel XE#2504]) -> [SKIP][441] ([Intel XE#1130])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][442] ([Intel XE#1130]) -> [SKIP][443] ([Intel XE#2905]) +13 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][444] ([Intel XE#2905]) -> [SKIP][445] ([Intel XE#1130]) +16 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][446] ([Intel XE#1000]) -> [TIMEOUT][447] ([Intel XE#1473])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [SKIP][448] ([Intel XE#1130]) -> [FAIL][449] ([Intel XE#2364])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][450] ([Intel XE#1473]) -> [SKIP][451] ([Intel XE#1130])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][452] ([Intel XE#1130]) -> [SKIP][453] ([Intel XE#2322]) +10 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][454] ([Intel XE#2322]) -> [SKIP][455] ([Intel XE#1130]) +13 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [FAIL][456] -> [SKIP][457] ([Intel XE#1130]) +2 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][458] ([Intel XE#1130]) -> [SKIP][459] ([Intel XE#586])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_mmap@small-bar.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][460] ([Intel XE#2248]) -> [SKIP][461] ([Intel XE#1130])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][462] ([Intel XE#1130]) -> [SKIP][463] ([Intel XE#1420])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][464] ([Intel XE#2284]) -> [SKIP][465] ([Intel XE#1130])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][466] ([Intel XE#1130]) -> [SKIP][467] ([Intel XE#2284]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][468] ([Intel XE#944]) -> [SKIP][469] ([Intel XE#1130]) +5 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][470] ([Intel XE#1130]) -> [SKIP][471] ([Intel XE#944]) +3 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][472] -> [SKIP][473] ([Intel XE#1130])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f -> xe-pw-140632v2

  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f
  xe-pw-140632v2: 140632v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/index.html

--===============2697939562840791626==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Add the loop only for DP encoders (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140632/">https://patchwork.freedesktop.org/series/140632/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f_full -&gt; xe-pw-140632v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140632v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140632v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140632v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes@plane-59.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140632v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_psr@psr-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@kms_psr@psr-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +249 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_addfb_basic@unused-modifier.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_addfb_basic@unused-modifier.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_cursor_legacy@torture-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +122 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@xe_exec_basic@many-null-defer-mmap.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981">Intel XE#2981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@xe_exec_basic@many-null-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">PASS</a> +239 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-adlp-1/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-adlp-4/igt@kms_hdr@bpc-switch-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_psr@pr-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v2/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f -&gt; xe-pw-140632v2</li>
</ul>
<p>IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f<br />
  xe-pw-140632v2: 140632v2</p>

</body>
</html>

--===============2697939562840791626==--
