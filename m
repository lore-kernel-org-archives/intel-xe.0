Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E2D3E194
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 01:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510110E261;
	Sat, 19 Oct 2024 01:28:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511210E25B;
 Sat, 19 Oct 2024 01:28:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3232545325144267939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/mmap=3A_Add_mmap_support?=
 =?utf-8?q?_for_PCI_memory_barrier_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Oct 2024 01:28:52 -0000
Message-ID: <172930133230.1301514.11687584019918217455@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018104639.855216-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241018104639.855216-1-tejas.upadhyay@intel.com>
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

--===============3232545325144267939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev2)
URL   : https://patchwork.freedesktop.org/series/139769/
State : failure

== Summary ==

CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full -> xe-pw-139769v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139769v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139769v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139769v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        [FAIL][10] ([Intel XE#2333]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - {shard-bmg}:        [SKIP][12] ([Intel XE#3007]) -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][14] +3 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  
Known issues
------------

  Here are the changes found in xe-pw-139769v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033]) +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1701]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][21] ([Intel XE#1874]) +2 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#3086])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1204])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#1231]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1231])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2890])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#2191])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#367]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +17 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#787]) +76 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1727])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1195] / [Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1195] / [Intel XE#3113])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#373]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#308]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2577]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#3106]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#1475])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#323])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2958])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#701])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1137])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1135])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#310])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#301]) +14 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#886]) +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#1204]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2351] / [Intel XE#2890])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#651]) +23 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#1861])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#2890])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#1861])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#656]) +19 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +23 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#658])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#653]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-436/igt@kms_hdr@bpc-switch-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#616]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2763]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2938])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#870])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#870])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1122]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1129])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#2042])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1489]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1489]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#1649]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#2948]) +3 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#2939])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1127])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1127])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#327])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#327]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#362])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#899])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2443]) +3 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_vrr@flipline.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-5/igt@kms_vrr@flipline.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#2423])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@testdisplay.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1447])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#1050])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#455]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1126])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2905]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2905]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#261] / [Intel XE#688])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][127] -> [TIMEOUT][128] ([Intel XE#1473] / [Intel XE#402])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][129] -> [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#1473])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][131] ([Intel XE#1473])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][132] -> [TIMEOUT][133] ([Intel XE#1473])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#688])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-dg2-set2:     [PASS][135] -> [SKIP][136] ([Intel XE#1130]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1392]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [PASS][138] -> [FAIL][139] ([Intel XE#2125])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1130]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +21 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288]) +10 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_reset@virtual-close-fd:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#1081])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_reset@virtual-close-fd.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2229])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2541]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#2541]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_oa@map-oa-buffer.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][147] ([Intel XE#1173]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2284] / [Intel XE#366])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2284] / [Intel XE#366])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][150] -> [ABORT][151] ([Intel XE#1694] / [Intel XE#1794])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][152] -> [ABORT][153] ([Intel XE#1358] / [Intel XE#1607])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@xe_pm@s4-basic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@xe_pm@s4-basic.html
    - shard-dg2-set2:     [PASS][154] -> [ABORT][155] ([Intel XE#1358]) +1 other test abort
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@xe_pm@s4-basic.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#579])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][157] -> [FAIL][158] ([Intel XE#958])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#944]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [PASS][161] -> [FAIL][162] ([Intel XE#1081])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - {shard-bmg}:        [FAIL][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
    - shard-dg2-set2:     [FAIL][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - {shard-bmg}:        [DMESG-WARN][167] ([Intel XE#877]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][169] -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][171] ([Intel XE#1701]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - {shard-bmg}:        [SKIP][175] ([Intel XE#2231]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][179] ([Intel XE#2436]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [FAIL][181] ([Intel XE#2577]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][183] ([Intel XE#1475]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2423] / [i915#2575]) -> [PASS][186] +12 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][187] ([Intel XE#301]) -> [PASS][188] +7 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][191] ([Intel XE#886]) -> [PASS][192] +6 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - {shard-bmg}:        [SKIP][193] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][195] ([Intel XE#1861]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2890]) -> [PASS][198] +2 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [ABORT][199] ([Intel XE#2625]) -> [PASS][200] +2 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][201] ([Intel XE#1874]) -> [PASS][202] +2 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][203] ([Intel XE#2029]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][205] ([Intel XE#2042]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-lnl:          [DMESG-WARN][207] -> [PASS][208] +2 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  * igt@kms_prop_blob@basic:
    - {shard-bmg}:        [SKIP][209] ([Intel XE#3007]) -> [PASS][210] +11 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_prop_blob@basic.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-5/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][211] ([Intel XE#2948]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-dpms:
    - shard-lnl:          [FAIL][213] ([Intel XE#1649]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_psr@psr2-dpms.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_psr@psr2-dpms.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][215] ([Intel XE#2443]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_vrr@max-min.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][217] ([Intel XE#2364]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][219] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][220] +2 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1130]) -> [PASS][222] +24 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_basic@many-basic-defer-bind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-lnl:          [FAIL][223] ([Intel XE#1630]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [SKIP][225] ([Intel XE#1192]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][227] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][229] ([Intel XE#1794]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-dg2-set2:     [ABORT][231] ([Intel XE#1794]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-all:
    - {shard-bmg}:        [SKIP][233] ([Intel XE#1130]) -> [PASS][234] +29 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_spin_batch@spin-all.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#316]) -> [SKIP][236] ([Intel XE#2890])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2890]) -> [SKIP][238] ([Intel XE#316])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][240] ([Intel XE#607])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][242] ([Intel XE#1124])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2890]) -> [SKIP][244] ([Intel XE#455] / [Intel XE#787])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2890]) -> [SKIP][246] ([Intel XE#2907])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][248] ([Intel XE#455] / [Intel XE#787])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#373]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2423] / [i915#2575]) -> [SKIP][252] ([Intel XE#373])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#455])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x32.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2890]) -> [SKIP][256] ([Intel XE#455])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         [TIMEOUT][257] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][258] ([Intel XE#1138])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_feature_discovery@display-4x.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         [TIMEOUT][259] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][260] ([Intel XE#310])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#651]) -> [SKIP][262] ([Intel XE#2890]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][263] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][264] ([Intel XE#1861]) +1 other test fail
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][266] ([Intel XE#651])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2890]) -> [SKIP][268] ([Intel XE#651]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#653]) -> [SKIP][270] ([Intel XE#2890])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][272] ([Intel XE#653])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-adlp:         [TIMEOUT][273] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][274] ([Intel XE#653])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2890]) -> [SKIP][276] ([Intel XE#653]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2890]) -> [SKIP][278] ([Intel XE#2927])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1489]) -> [SKIP][280] ([Intel XE#2890])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2890]) -> [SKIP][282] ([Intel XE#1489])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2890]) -> [SKIP][284] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][286] ([Intel XE#2850] / [Intel XE#929])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr@pr-sprite-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         [TIMEOUT][287] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][288] ([Intel XE#1127])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#327]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1500]) -> [SKIP][292] ([Intel XE#362])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         [TIMEOUT][293] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][294] ([Intel XE#455] / [Intel XE#488])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_ccs@suspend-resume.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1130]) -> [SKIP][296] ([Intel XE#2905]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1130]) -> [SKIP][298] ([Intel XE#288]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1130]) -> [SKIP][300] ([Intel XE#2541])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2541]) -> [SKIP][302] ([Intel XE#1130])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_oa@polling-small-buf.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8078 -> IGT_8079
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-pw-139769v2

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8079: 31475ea8fdeef38b5ae6b4b8ca6d4e42f8285b42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-pw-139769v2: 139769v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html

--===============3232545325144267939==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmap: Add mmap support for PCI memory barrier (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139769/">https://patchwork.freedesktop.org/series/139769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_full -&gt; xe-pw-139769v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139769v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139769v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139769v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139769v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-436/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-5/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_evict@evict-beng-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125">Intel XE#2125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_reset@virtual-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-5/igt@kms_prop_blob@basic.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-3/igt@kms_psr@psr2-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-1/igt@kms_psr@psr2-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-1/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-2/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_basic@many-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@xe_exec_basic@many-basic-defer-bind.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-3/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-bmg-2/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-bmg-1/igt@xe_spin_batch@spin-all.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_feature_discovery@display-4x.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-436/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-adlp-6/igt@xe_ccs@suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-adlp-4/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-433/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2091-c1837d4e9af4e9df3109960341105c035b441667/shard-dg2-463/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8078 -&gt; IGT_8079</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-pw-139769v2</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8079: 31475ea8fdeef38b5ae6b4b8ca6d4e42f8285b42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-pw-139769v2: 139769v2</p>

</body>
</html>

--===============3232545325144267939==--
