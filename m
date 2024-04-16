Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD4C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 11:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C0D112BD0;
	Tue, 16 Apr 2024 11:37:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7439112BCF;
 Tue, 16 Apr 2024 11:37:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1097384979616095159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_select_X86=5FPLATFORM?=
 =?utf-8?q?=5FDEVICES_when_ACPI=5FWMI_is_selected?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lu Yao" <yaolu@kylinos.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 11:37:02 -0000
Message-ID: <171326742274.1443400.7660278787447583044@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415025215.15811-1-yaolu@kylinos.cn>
In-Reply-To: <20240415025215.15811-1-yaolu@kylinos.cn>
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

--===============1097384979616095159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected
URL   : https://patchwork.freedesktop.org/series/132447/
State : success

== Summary ==

CI Bug Log - changes from xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889_full -> xe-pw-132447v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132447v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - {shard-lnl}:        [DMESG-WARN][1] ([Intel XE#1494]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - {shard-lnl}:        [SKIP][3] ([Intel XE#1407]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-lnl}:        [SKIP][5] ([Intel XE#1124]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - {shard-lnl}:        [SKIP][7] ([Intel XE#1399]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - {shard-lnl}:        [SKIP][9] ([Intel XE#306]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_chamelium_color@ctm-0-50.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - {shard-lnl}:        [SKIP][11] ([Intel XE#373]) -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - {shard-lnl}:        [SKIP][13] ([Intel XE#307]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - {shard-lnl}:        [SKIP][15] ([Intel XE#1424]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - {shard-lnl}:        [SKIP][17] ([Intel XE#323]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - {shard-lnl}:        [SKIP][19] ([Intel XE#1401]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - {shard-lnl}:        [SKIP][21] ([Intel XE#651]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - {shard-lnl}:        [SKIP][23] ([Intel XE#656]) -> [SKIP][24] +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
    - {shard-lnl}:        [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html

  * igt@kms_plane_multiple@tiling-yf:
    - {shard-lnl}:        [SKIP][27] ([Intel XE#1446]) -> [SKIP][28] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - {shard-lnl}:        [SKIP][29] ([Intel XE#305]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - {shard-lnl}:        [PASS][31] -> [TIMEOUT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - {shard-lnl}:        [SKIP][33] ([Intel XE#1128]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@pr-suspend:
    - {shard-lnl}:        [SKIP][35] ([Intel XE#1406]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_psr@pr-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-suspend:
    - {shard-lnl}:        [PASS][37] -> [DMESG-WARN][38] +2 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_psr@psr2-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - {shard-lnl}:        [PASS][39] -> [SKIP][40] +51 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - {shard-lnl}:        [SKIP][41] ([Intel XE#688]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-simple.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@once-parallel-userptr-invalidate:
    - {shard-lnl}:        NOTRUN -> [SKIP][43] +22 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html

  * {igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null}:
    - {shard-lnl}:        [SKIP][44] ([Intel XE#1392]) -> [SKIP][45] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - {shard-lnl}:        [FAIL][46] ([Intel XE#1256]) -> [INCOMPLETE][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_gt_freq@freq_suspend:
    - {shard-lnl}:        [SKIP][48] ([Intel XE#584]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_gt_freq@freq_suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@d3-mmap-vram:
    - {shard-lnl}:        [SKIP][50] ([Intel XE#1444]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_pm@d3-mmap-vram.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_pm@d3-mmap-vram.html

  
Known issues
------------

  Here are the changes found in xe-pw-132447v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1125] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#650]) +7 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1185] / [Intel XE#1201]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][57] ([Intel XE#1231])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#616]) +4 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1252])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#787]) +35 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#455]) +23 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#1188])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#308])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][71] ([Intel XE#1195] / [Intel XE#927])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][72] ([Intel XE#1195])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][73] ([Intel XE#581])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [PASS][74] -> [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-dg2-set2:     [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#877])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][79] ([Intel XE#1214]) +2 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@d-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][81] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][82] ([Intel XE#324]) +2 other tests dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#616]) +4 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#656]) +42 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214]) +7 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][90] -> [FAIL][91] ([Intel XE#361]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1122] / [Intel XE#1201])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][96] ([Intel XE#718])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#734])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1211])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_pm_rpm@cursor.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#929]) +17 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1149] / [Intel XE#1201])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1127] / [Intel XE#1201])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][106] ([Intel XE#1174])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#330])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][108] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#756])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#1080]) +19 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1123] / [Intel XE#1201])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][113] -> [INCOMPLETE][114] ([Intel XE#1195] / [Intel XE#1473]) +1 other test incomplete
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][118] ([Intel XE#1619])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][120] ([Intel XE#1068])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#1256])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1061] / [Intel XE#1201])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#366])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][125] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [FAIL][126] ([Intel XE#1043] / [Intel XE#845]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][130] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][131] +7 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - {shard-lnl}:        [FAIL][132] ([Intel XE#480]) -> [PASS][133] +3 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
    - {shard-lnl}:        [DMESG-WARN][134] ([Intel XE#1330]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][136] ([Intel XE#616]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-dpms:
    - {shard-lnl}:        [FAIL][138] ([Intel XE#718]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [FAIL][140] ([Intel XE#1203]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][142] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#1214]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][146] ([Intel XE#821]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#1259]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][150] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][152] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - {shard-lnl}:        [DMESG-FAIL][154] ([Intel XE#1069] / [Intel XE#1537]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_store@persistent:
    - {shard-lnl}:        [INCOMPLETE][156] -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_exec_store@persistent.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-2/igt@xe_exec_store@persistent.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][158] ([Intel XE#1081]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-dg2-set2:     [TIMEOUT][160] ([Intel XE#1167] / [Intel XE#1356]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][162] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@xe_gt_freq@freq_low_max.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_dma_buf:
    - {shard-lnl}:        [SKIP][164] -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s2idle-multiple-execs:
    - {shard-lnl}:        [DMESG-WARN][166] ([Intel XE#1595]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-6/igt@xe_pm@s2idle-multiple-execs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [WARN][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][171] ([Intel XE#1188])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-464/igt@kms_content_protection@uevent.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_cursor_legacy@single-bo.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][174] ([Intel XE#1195]) -> [DMESG-WARN][175] ([Intel XE#1191] / [Intel XE#1214])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-plain-flip:
    - shard-adlp:         [INCOMPLETE][176] ([Intel XE#1150] / [Intel XE#1195] / [Intel XE#1330]) -> [DMESG-WARN][177] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@basic-plain-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - shard-adlp:         [INCOMPLETE][178] ([Intel XE#1195] / [Intel XE#1330]) -> [DMESG-WARN][179] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [INCOMPLETE][180] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][181] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][182] ([Intel XE#1195]) -> [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#869])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][186] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][189] ([Intel XE#1191] / [Intel XE#1214])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][190] ([Intel XE#1473] / [Intel XE#821]) -> [FAIL][191] ([Intel XE#1259])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][193] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
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
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889 -> xe-pw-132447v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889: 1bfe3965a846936d93b6e69385e53f1bd1c3b889
  xe-pw-132447v1: 132447v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/index.html

--===============1097384979616095159==
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
<tr><td><b>Series:</b></td><td>drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132447/">https://patchwork.freedesktop.org/series/132447/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889_full -&gt; xe-pw-132447v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132447v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494">Intel XE#1494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_psr@pr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@kms_psr@psr2-suspend.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_exec_balancer@once-parallel-userptr-invalidate.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_pm@d3-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444">Intel XE#1444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-7/igt@xe_pm@d3-mmap-vram.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132447v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185">Intel XE#1185</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@d-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@persistent:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-5/igt@xe_exec_store@persistent.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-2/igt@xe_exec_store@persistent.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-466/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-lnl-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-lnl-3/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-434/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132447v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889 -&gt; xe-pw-132447v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889: 1bfe3965a846936d93b6e69385e53f1bd1c3b889<br />
  xe-pw-132447v1: 132447v1</p>

</body>
</html>

--===============1097384979616095159==--
