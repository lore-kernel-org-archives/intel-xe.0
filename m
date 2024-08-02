Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11D3C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 04:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306510E634;
	Fri,  2 Aug 2024 04:48:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678F610E634;
 Fri,  2 Aug 2024 04:48:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9004759287432230100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2=3A_Introduce_perform?=
 =?utf-8?q?ance_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Aug 2024 04:48:41 -0000
Message-ID: <172257412139.490218.17531123059608620776@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1722607628.git.akshata.jahagirdar@intel.com>
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

--===============9004759287432230100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Introduce performance changes
URL   : https://patchwork.freedesktop.org/series/136821/
State : failure

== Summary ==

CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -> xe-pw-136821v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136821v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136821v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136821v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@core_getversion@basic.html
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@core_getversion@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@core_getversion@basic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          [PASS][10] -> [SKIP][11] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][12] -> [FAIL][13] +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_vrr@flip-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1201]) -> [SKIP][15] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][22] ([Intel XE#651]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][24] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][25] +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][26] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@bad-pitch-999:
    - {shard-bmg}:        NOTRUN -> [SKIP][28] +17 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - {shard-bmg}:        NOTRUN -> [FAIL][29] +4 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#2327]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - {shard-bmg}:        [SKIP][32] ([Intel XE#1124]) -> [SKIP][33] +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - {shard-bmg}:        [SKIP][34] ([Intel XE#367]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - {shard-bmg}:        [SKIP][36] ([Intel XE#2251]) -> [SKIP][37] +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - {shard-bmg}:        [SKIP][38] ([Intel XE#2325]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - {shard-bmg}:        [SKIP][40] ([Intel XE#2252]) -> [SKIP][41] +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - {shard-bmg}:        [SKIP][42] ([Intel XE#2390]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][44] -> [SKIP][45] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@kms_content_protection@legacy.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - {shard-bmg}:        [SKIP][46] ([Intel XE#2321]) -> [SKIP][47] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - {shard-bmg}:        [SKIP][48] ([Intel XE#2320]) -> [SKIP][49] +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [PASS][50] -> [DMESG-WARN][51] +2 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [SKIP][52] ([Intel XE#2291]) -> [DMESG-WARN][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - {shard-bmg}:        [SKIP][54] ([Intel XE#1508]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-bmg}:        [FAIL][56] ([Intel XE#1695]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - {shard-bmg}:        [SKIP][58] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - {shard-bmg}:        [SKIP][60] ([Intel XE#2380]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - {shard-bmg}:        [SKIP][62] ([Intel XE#2293]) -> [SKIP][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][64] ([Intel XE#2311]) -> [SKIP][65] +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - {shard-bmg}:        [FAIL][66] ([Intel XE#2333]) -> [SKIP][67] +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - {shard-bmg}:        [SKIP][68] ([Intel XE#2312]) -> [SKIP][69] +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - {shard-bmg}:        [SKIP][70] ([Intel XE#2352]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-bmg}:        [SKIP][72] ([Intel XE#2350]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][74] ([Intel XE#2313]) -> [SKIP][75] +11 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@tiling-yf:
    - {shard-bmg}:        [SKIP][76] ([Intel XE#2393]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - {shard-bmg}:        [PASS][78] -> [FAIL][79] +4 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_plane_multiple@tiling-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - {shard-bmg}:        [SKIP][80] ([Intel XE#2318]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-3:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][82] +3 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-3.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - {shard-bmg}:        [SKIP][83] ([Intel XE#870]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - {shard-bmg}:        [SKIP][85] ([Intel XE#2392]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-bmg}:        [SKIP][87] ([Intel XE#1439]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - {shard-bmg}:        [SKIP][89] ([Intel XE#1489]) -> [SKIP][90] +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - {shard-bmg}:        [SKIP][91] ([Intel XE#2387]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - {shard-bmg}:        [SKIP][93] ([Intel XE#2234]) -> [SKIP][94] +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_psr@fbc-pr-primary-blt.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - {shard-bmg}:        [SKIP][95] ([Intel XE#2329]) -> [SKIP][96] +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - {shard-bmg}:        [SKIP][97] ([Intel XE#2426]) -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - {shard-bmg}:        [SKIP][99] ([Intel XE#756]) -> [SKIP][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [SKIP][101] -> [TIMEOUT][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - {shard-bmg}:        [PASS][103] -> [SKIP][104] +80 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - {shard-bmg}:        [SKIP][105] ([Intel XE#2322]) -> [SKIP][106] +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_module_load@many-reload:
    - {shard-bmg}:        [FAIL][107] -> [TIMEOUT][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_module_load@many-reload.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_peer2peer@write:
    - {shard-bmg}:        [SKIP][109] ([Intel XE#2427]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_peer2peer@write.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - {shard-bmg}:        [SKIP][111] ([Intel XE#1130]) -> [DMESG-WARN][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology:
    - {shard-bmg}:        [SKIP][113] ([Intel XE#944]) -> [SKIP][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@xe_query@multigpu-query-topology.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@xe_query@multigpu-query-topology.html

  
Known issues
------------

  Here are the changes found in xe-pw-136821v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][115] -> [SKIP][116] ([Intel XE#1201] / [Intel XE#2423])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@core_getstats.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@core_getstats.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     NOTRUN -> [ABORT][117] ([Intel XE#2418])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1201] / [Intel XE#2134])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@fbdev@info.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@intel_hwmon@hwmon-write.html
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2351]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [PASS][122] -> [SKIP][123] ([Intel XE#1201]) +108 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_addfb_basic@legacy-format.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][124] -> [DMESG-WARN][125] ([Intel XE#324])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][126] -> [DMESG-WARN][127] ([Intel XE#2338])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#664])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#1426]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-lnl:          [PASS][131] -> [SKIP][132] ([Intel XE#2423]) +39 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1407]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#1201]) +20 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][138] -> [FAIL][139] ([Intel XE#1659])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#2351])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-lnl:          [PASS][142] -> [SKIP][143] ([Intel XE#2351]) +35 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1124])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][146] ([Intel XE#1204])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#610])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1428])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#2191])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#787]) +104 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#787]) +20 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1399]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#306]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_chamelium_color@degamma.html
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1201]) +51 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#373]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-negative:
    - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#1201] / [i915#2575]) +19 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_color@ctm-negative.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_color@ctm-negative.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][171] ([Intel XE#1178]) +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][172] ([Intel XE#1204]) +1 other test fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#599]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#1201] / [Intel XE#308])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1424]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#309])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([i915#2575]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][181] -> [SKIP][182] ([Intel XE#1201] / [Intel XE#2351]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-adlp:         [PASS][183] -> [SKIP][184] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1397] / [Intel XE#1745])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1397])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1401]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][188] ([Intel XE#324])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#1401] / [Intel XE#1745])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#651]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#651]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#1201] / [Intel XE#656]) +26 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#2351]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#1151] / [Intel XE#1201])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#653]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1201] / [Intel XE#658])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1469])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#656]) +10 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#1201] / [Intel XE#2351])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][206] -> [SKIP][207] ([i915#2575]) +8 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_lease@lease-invalid-crtc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][208] -> [DMESG-FAIL][209] ([Intel XE#324]) +1 other test dmesg-fail
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-4:
    - shard-lnl:          [PASS][210] -> [DMESG-WARN][211] ([Intel XE#324])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-adlp:         [PASS][212] -> [INCOMPLETE][213] ([Intel XE#1195])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][214] ([Intel XE#616]) +3 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [PASS][215] -> [SKIP][216] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +20 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#2318]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#1122] / [Intel XE#1201])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [PASS][225] -> [FAIL][226] ([Intel XE#2028]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1406])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][229] ([Intel XE#1874]) +4 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#2423]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#1127] / [Intel XE#1201])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][233] ([Intel XE#1127] / [Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#1201] / [Intel XE#327])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#1437])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#455])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#1435]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][238] -> [FAIL][239] ([Intel XE#771] / [Intel XE#899])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][240] -> [FAIL][241] ([Intel XE#899])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][242] ([Intel XE#2019]) +1 other test dmesg-warn
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [PASS][244] -> [INCOMPLETE][245] ([Intel XE#1195]) +1 other test incomplete
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_ccs@suspend-resume.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][246] ([Intel XE#1050])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#1130] / [Intel XE#1201]) +18 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#1126] / [Intel XE#1201])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][249] -> [INCOMPLETE][250] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#688]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][253] ([Intel XE#1600])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][254] -> [INCOMPLETE][255] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][256] -> [TIMEOUT][257] ([Intel XE#1473])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-dg2-set2:     [PASS][259] -> [SKIP][260] ([Intel XE#1130]) +15 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][261] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#1130]) +8 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][263] ([Intel XE#1392]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][264] -> [FAIL][265] ([Intel XE#1069])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [PASS][266] -> [SKIP][267] ([Intel XE#1130]) +101 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][268] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][270] ([Intel XE#288])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#1201] / [Intel XE#2360])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#1201] / [Intel XE#2360])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][273] ([Intel XE#358])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][274] -> [INCOMPLETE][275] ([Intel XE#2105])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-adlp:         [PASS][276] -> [DMESG-WARN][277] ([Intel XE#2226] / [Intel XE#358])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][278] ([Intel XE#1999]) +1 other test fail
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@cpu-caching:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][279] ([Intel XE#2226]) +3 other tests dmesg-warn
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_mmap@cpu-caching.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#1416])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][281] ([Intel XE#1008] / [Intel XE#1201])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][282] ([Intel XE#1130] / [Intel XE#1201]) +9 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][283] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][284] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#2419])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][286] ([Intel XE#2284] / [Intel XE#366])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_pm@d3cold-basic.html
    - shard-adlp:         NOTRUN -> [SKIP][287] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][288] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#1201] / [Intel XE#2284])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][290] -> [SKIP][291] ([Intel XE#1130] / [Intel XE#1201]) +85 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][292] -> [DMESG-WARN][293] ([Intel XE#1551] / [Intel XE#569])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][294] ([Intel XE#584])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-adlp:         NOTRUN -> [DMESG-WARN][295] ([Intel XE#1191] / [Intel XE#1727] / [Intel XE#2226])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][296] ([Intel XE#1551] / [Intel XE#569])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          NOTRUN -> [ABORT][297] ([Intel XE#1358] / [Intel XE#1607])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [PASS][298] -> [DMESG-WARN][299] ([Intel XE#2019])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][300] -> [FAIL][301] ([Intel XE#958])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [PASS][302] -> [FAIL][303] ([Intel XE#958])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][304] ([Intel XE#944])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html
    - shard-adlp:         NOTRUN -> [SKIP][305] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#1201] / [Intel XE#944])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_vm@large-misaligned-binds-2097152:
    - shard-dg2-set2:     NOTRUN -> [SKIP][307] ([Intel XE#1130]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_vm@large-misaligned-binds-2097152.html

  * igt@xe_vm@large-misaligned-binds-8388608:
    - shard-adlp:         [PASS][308] -> [SKIP][309] ([Intel XE#1130] / [Intel XE#1201]) +49 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@xe_vm@large-misaligned-binds-8388608.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-8388608.html

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - shard-adlp:         [PASS][310] -> [DMESG-WARN][311] ([Intel XE#2226]) +13 other tests dmesg-warn
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@xe_vm@large-split-misaligned-binds-1073741824.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-1073741824.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][312] ([Intel XE#1760])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][313] ([Intel XE#1760])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][314] ([Intel XE#1760])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
    - shard-lnl:          [SKIP][317] ([Intel XE#1885]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@core_hotunplug@hotunplug-rescan.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][319] ([Intel XE#911]) -> [PASS][320] +3 other tests pass
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][321] ([Intel XE#324]) -> [PASS][322] +1 other test pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][323] ([Intel XE#2338]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        [INCOMPLETE][325] -> [PASS][326] +3 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201]) -> [PASS][328] +8 other tests pass
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][329] ([Intel XE#2436]) -> [PASS][330] +1 other test pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][332] +14 other tests pass
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-adlp:         [SKIP][333] ([Intel XE#1201]) -> [PASS][334] +51 other tests pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - {shard-bmg}:        [SKIP][335] ([Intel XE#2291]) -> [PASS][336] +3 other tests pass
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [SKIP][337] ([Intel XE#2351]) -> [PASS][338] +17 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - {shard-bmg}:        [DMESG-WARN][339] -> [PASS][340] +5 other tests pass
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][341] ([Intel XE#1195] / [Intel XE#2019]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][343] ([Intel XE#1195]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - {shard-bmg}:        [SKIP][345] ([Intel XE#2316]) -> [PASS][346] +3 other tests pass
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_getfb@getfb-handle-protection:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [i915#2575]) -> [PASS][348] +11 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_getfb@getfb-handle-protection.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_getfb@getfb-handle-protection.html

  * igt@kms_hdr@bpc-switch:
    - shard-lnl:          [SKIP][349] ([Intel XE#2423]) -> [PASS][350] +22 other tests pass
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_hdr@bpc-switch.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][351] ([Intel XE#2019]) -> [PASS][352] +1 other test pass
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][353] ([Intel XE#324]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][355] ([Intel XE#324]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][357] ([Intel XE#361]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][359] -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][361] ([Intel XE#718]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - {shard-bmg}:        [SKIP][363] ([Intel XE#1435]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#771] / [Intel XE#899]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][367] ([Intel XE#899]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][369] -> [PASS][370] +2 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_vrr@flipline.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-lnl:          [SKIP][371] ([Intel XE#1130]) -> [PASS][372] +52 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_ccs@block-multicopy-inplace.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          [FAIL][373] ([Intel XE#2028]) -> [PASS][374] +7 other tests pass
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][375] -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - {shard-bmg}:        [SKIP][377] -> [PASS][378] +83 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][380] +53 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-adlp:         [SKIP][381] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][382] +18 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [INCOMPLETE][383] ([Intel XE#1169] / [Intel XE#1356]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [FAIL][385] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][387] ([Intel XE#1358]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][389] ([Intel XE#1794]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - {shard-bmg}:        [SKIP][391] ([Intel XE#1130]) -> [PASS][392] +10 other tests pass
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [ABORT][393] ([Intel XE#2421]) -> [ABORT][394] ([Intel XE#2418]) +3 other tests abort
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@core_hotunplug@hotunbind-rebind.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [ABORT][395] ([Intel XE#2421]) -> [ABORT][396] ([Intel XE#2418]) +2 other tests abort
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html
    - shard-lnl:          [ABORT][397] ([Intel XE#2421]) -> [ABORT][398] ([Intel XE#2418]) +3 other tests abort
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_3d:
    - shard-lnl:          [SKIP][399] ([Intel XE#1465]) -> [SKIP][400] ([Intel XE#2423])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_3d.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_3d.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#316]) -> [SKIP][402] ([Intel XE#1201]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][403] ([Intel XE#1201]) -> [SKIP][404] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [DMESG-WARN][405] ([Intel XE#1725]) -> [SKIP][406] ([Intel XE#2351])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][408] ([Intel XE#316]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#316]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#316])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][411] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][412] ([Intel XE#1201]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][414] ([Intel XE#1201] / [Intel XE#2351])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-lnl:          [SKIP][415] ([Intel XE#1407]) -> [SKIP][416] ([Intel XE#2351]) +2 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][417] ([Intel XE#1231]) -> [DMESG-FAIL][418] ([Intel XE#324])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][419] ([Intel XE#1231]) -> [SKIP][420] ([Intel XE#1201])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][422] ([Intel XE#1124]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][424] ([Intel XE#1201]) +4 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][426] ([Intel XE#607])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#610]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#610])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1201]) -> [SKIP][430] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][431] ([Intel XE#2351]) -> [SKIP][432] ([Intel XE#1124]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-adlp:         [SKIP][433] ([Intel XE#1201]) -> [FAIL][434] ([Intel XE#1204]) +1 other test fail
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][436] ([Intel XE#1124] / [Intel XE#1201])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#2351])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1124]) -> [SKIP][440] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][441] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][442] ([Intel XE#1201]) +10 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][444] ([Intel XE#2351]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1124]) -> [SKIP][446] ([Intel XE#1201])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201]) -> [SKIP][448] ([Intel XE#1124])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][449] ([Intel XE#1124]) -> [SKIP][450] ([Intel XE#2351]) +8 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1124]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#2351])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#346]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#346])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201] / [i915#2575]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#367])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          [SKIP][457] ([Intel XE#2423]) -> [SKIP][458] ([Intel XE#2191])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#2191])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2191]) -> [SKIP][462] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][464] ([Intel XE#1201] / [i915#2575])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          [SKIP][465] ([Intel XE#1512]) -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-adlp:         [SKIP][467] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][468] ([Intel XE#1201])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][470] ([Intel XE#367])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
    - shard-adlp:         [SKIP][471] ([Intel XE#1201]) -> [SKIP][472] ([Intel XE#1201] / [Intel XE#367])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][474] ([Intel XE#367]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1201] / [i915#2575]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          [SKIP][477] ([Intel XE#367]) -> [SKIP][478] ([Intel XE#2423])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
    - shard-adlp:         [SKIP][479] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][480] ([Intel XE#1201])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#367]) -> [SKIP][482] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][483] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][484] ([Intel XE#1201]) +8 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][486] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][488] ([Intel XE#1201])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][489] ([Intel XE#2351]) -> [SKIP][490] ([Intel XE#1399]) +6 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][492] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#787]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][496] ([Intel XE#2351])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][497] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][498] ([Intel XE#1201]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1201]) -> [SKIP][500] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][502] ([Intel XE#787]) +27 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][504] ([Intel XE#1201]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][505] ([Intel XE#1399]) -> [SKIP][506] ([Intel XE#2351]) +6 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][507] ([Intel XE#1201]) -> [SKIP][508] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1201]) -> [SKIP][510] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][512] ([Intel XE#1201])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          [SKIP][513] ([Intel XE#314]) -> [SKIP][514] ([Intel XE#2351])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][515] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][516] ([Intel XE#1201]) +1 other test skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][518] ([Intel XE#1201] / [i915#2575])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          [SKIP][519] ([Intel XE#306]) -> [SKIP][520] ([Intel XE#2423]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#306]) -> [SKIP][522] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][524] ([Intel XE#1201] / [Intel XE#373])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][526] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][528] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-lnl:          [SKIP][529] ([Intel XE#373]) -> [SKIP][530] ([Intel XE#2423]) +8 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_chamelium_frames@vga-frame-dump.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-adlp:         [SKIP][531] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][532] ([Intel XE#1201]) +7 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][534] ([i915#2575]) +2 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#373]) -> [SKIP][536] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1201] / [i915#2575]) -> [SKIP][538] ([Intel XE#1201] / [Intel XE#373])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          [SKIP][539] ([Intel XE#2423]) -> [SKIP][540] ([Intel XE#373]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-adlp:         [SKIP][541] ([Intel XE#1201]) -> [SKIP][542] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][544] ([Intel XE#373]) +4 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         [SKIP][545] ([Intel XE#1201]) -> [SKIP][546] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_content_protection@content-type-change.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1201] / [i915#2575]) -> [SKIP][548] ([Intel XE#1201] / [Intel XE#455])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_content_protection@content-type-change.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          [SKIP][549] ([Intel XE#2423]) -> [SKIP][550] ([Intel XE#599]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_content_protection@content-type-change.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][552] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#307]) -> [SKIP][554] ([Intel XE#1201] / [i915#2575])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          [SKIP][555] ([Intel XE#307]) -> [SKIP][556] ([Intel XE#2423]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-adlp:         [SKIP][557] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][558] ([Intel XE#1201]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_content_protection@dp-mst-type-0.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][560] ([i915#2575])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][562] ([Intel XE#1201] / [Intel XE#455])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][564] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          [SKIP][565] ([Intel XE#1413]) -> [SKIP][566] ([Intel XE#2423]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         [SKIP][567] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][568] ([Intel XE#1201]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][570] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x10.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1201] / [i915#2575]) -> [SKIP][572] ([Intel XE#455])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#308]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#308])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][575] ([Intel XE#2423]) -> [SKIP][576] ([Intel XE#1424]) +2 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][578] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +3 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-lnl:          [SKIP][579] ([Intel XE#1424]) -> [SKIP][580] ([Intel XE#2423]) +3 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#455]) -> [SKIP][582] ([i915#2575])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][584] ([Intel XE#323])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          [SKIP][585] ([Intel XE#309]) -> [SKIP][586] ([Intel XE#2423])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-adlp:         [SKIP][587] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][588] ([Intel XE#1201])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][590] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          [SKIP][591] ([Intel XE#2423]) -> [SKIP][592] ([Intel XE#323]) +1 other test skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         [SKIP][593] ([Intel XE#1201]) -> [SKIP][594] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][596] ([Intel XE#1201] / [Intel XE#2351])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][598] ([Intel XE#1201]) +3 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          [SKIP][599] ([Intel XE#599]) -> [SKIP][600] ([Intel XE#2351])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         [SKIP][601] ([Intel XE#1201]) -> [SKIP][602] ([Intel XE#1201] / [Intel XE#776])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1201]) -> [SKIP][604] ([Intel XE#1201] / [Intel XE#776])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#701]) -> [SKIP][606] ([Intel XE#1201] / [Intel XE#701])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][607] ([Intel XE#702]) -> [SKIP][608] ([Intel XE#2423])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_feature_discovery@display-2x.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         [SKIP][609] ([Intel XE#1201] / [Intel XE#702]) -> [SKIP][610] ([Intel XE#1201])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_feature_discovery@display-2x.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         [SKIP][611] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][612] ([Intel XE#1201])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_feature_discovery@display-4x.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          [SKIP][613] ([Intel XE#2423]) -> [SKIP][614] ([Intel XE#1421])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-adlp:         [SKIP][615] ([Intel XE#1201]) -> [SKIP][616] ([Intel XE#1201] / [Intel XE#310])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][617] ([Intel XE#1421]) -> [SKIP][618] ([Intel XE#2423]) +3 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
    - shard-adlp:         [SKIP][619] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][620] ([Intel XE#1201]) +2 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         [SKIP][621] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][622] ([Intel XE#1201]) +14 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#1201]) -> [SKIP][624] ([Intel XE#1201] / [Intel XE#455])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][625] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][626] ([Intel XE#2351]) +5 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#455]) -> [SKIP][628] ([Intel XE#1201])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][630] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          [SKIP][631] ([Intel XE#2351]) -> [SKIP][632] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         [SKIP][633] ([Intel XE#1201]) -> [DMESG-FAIL][634] ([Intel XE#324])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#455]) -> [SKIP][636] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][637] ([Intel XE#1874]) -> [SKIP][638] ([Intel XE#1201]) +6 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][639] ([Intel XE#2423]) -> [SKIP][640] ([Intel XE#352]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][642] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][643] ([Intel XE#1201]) -> [SKIP][644] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1201]) -> [SKIP][646] ([Intel XE#651])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#651]) -> [SKIP][648] ([Intel XE#1201]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#1201]) -> [SKIP][650] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          [SKIP][651] ([Intel XE#2351]) -> [SKIP][652] ([Intel XE#656]) +9 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#651]) -> [SKIP][654] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][656] ([Intel XE#1201]) +11 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
    - shard-lnl:          [SKIP][657] ([Intel XE#651]) -> [SKIP][658] ([Intel XE#2351]) +10 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][659] ([Intel XE#1861]) -> [SKIP][660] ([Intel XE#1201])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][661] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][662] ([Intel XE#1201]) +33 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][664] ([Intel XE#1201] / [Intel XE#2351])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-lnl:          [SKIP][665] ([Intel XE#1469]) -> [SKIP][666] ([Intel XE#2351])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][667] ([Intel XE#1201]) -> [SKIP][668] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][669] ([Intel XE#2351]) -> [SKIP][670] ([Intel XE#651]) +3 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][671] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][672] ([Intel XE#1201]) +13 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][674] ([Intel XE#651]) +11 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][676] ([Intel XE#1201] / [Intel XE#2351])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#653]) -> [SKIP][678] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][679] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][680] ([Intel XE#1201]) +12 other tests skip
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][681] ([Intel XE#1201]) -> [SKIP][682] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#1201]) -> [SKIP][684] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#653]) -> [SKIP][686] ([Intel XE#1201])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][688] ([Intel XE#1201] / [Intel XE#653])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][690] ([Intel XE#2351])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         [SKIP][691] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][692] ([Intel XE#1201])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][693] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][694] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][696] ([Intel XE#1201]) +13 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#1201]) -> [SKIP][698] ([Intel XE#653]) +2 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#653]) -> [SKIP][700] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][702] ([Intel XE#653]) +6 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][703] ([Intel XE#656]) -> [SKIP][704] ([Intel XE#2351]) +29 other tests skip
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][705] ([Intel XE#599]) -> [SKIP][706] ([Intel XE#2423]) +4 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_hdr@invalid-metadata-sizes.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-lnl:          [SKIP][707] ([Intel XE#498]) -> [SKIP][708] ([Intel XE#2423])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][710] ([Intel XE#2318]) +2 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][712] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][713] ([Intel XE#2318]) -> [SKIP][714] ([Intel XE#2423]) +1 other test skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][716] ([Intel XE#870])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         [SKIP][717] ([Intel XE#1201]) -> [SKIP][718] ([Intel XE#1201] / [Intel XE#870])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1201]) -> [SKIP][720] ([Intel XE#1201] / [Intel XE#870])
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         [SKIP][721] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][722] ([Intel XE#1201])
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][724] ([Intel XE#1201])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][725] ([Intel XE#1430]) -> [SKIP][726] ([Intel XE#2351])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         [SKIP][727] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][728] ([Intel XE#1201])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][730] ([Intel XE#1201])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#908]) -> [SKIP][732] ([Intel XE#1201] / [Intel XE#908])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][733] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][734] ([Intel XE#1489])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][736] ([Intel XE#1201]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#1122]) -> [SKIP][738] ([Intel XE#1201])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][739] ([Intel XE#1128]) -> [SKIP][740] ([Intel XE#2351])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr2_su@page_flip-nv12.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         [SKIP][741] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][742] ([Intel XE#1201])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][744] ([Intel XE#1122])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#1201]) -> [SKIP][746] ([Intel XE#929])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-pr-dpms.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
    - shard-lnl:          [SKIP][747] ([Intel XE#2351]) -> [SKIP][748] ([Intel XE#1406]) +2 other tests skip
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         [SKIP][749] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][750] ([Intel XE#1201]) +6 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_psr@fbc-pr-primary-blt.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     [SKIP][751] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][752] ([Intel XE#1201]) +3 other tests skip
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-pr-primary-render.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         [SKIP][753] ([Intel XE#1201]) -> [SKIP][754] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][756] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#1201]) -> [SKIP][758] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][759] ([Intel XE#929]) -> [SKIP][760] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          [SKIP][761] ([Intel XE#1406]) -> [SKIP][762] ([Intel XE#2351]) +4 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr@pr-sprite-render.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_psr@pr-sprite-render.html
    - shard-dg2-set2:     [SKIP][763] ([Intel XE#929]) -> [SKIP][764] ([Intel XE#1201])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-render.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][765] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][766] ([Intel XE#929]) +6 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][767] ([Intel XE#1201]) -> [SKIP][768] ([Intel XE#1149] / [Intel XE#1201])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     [SKIP][769] ([Intel XE#1201]) -> [SKIP][770] ([Intel XE#1149] / [Intel XE#1201])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][771] ([Intel XE#2423]) -> [SKIP][772] ([Intel XE#1437])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-adlp:         [SKIP][773] ([Intel XE#1201]) -> [SKIP][774] ([Intel XE#1201] / [Intel XE#327])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2-set2:     [SKIP][775] ([Intel XE#1201] / [i915#2575]) -> [SKIP][776] ([Intel XE#1201] / [Intel XE#327])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         [SKIP][777] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][778] ([Intel XE#1201]) +2 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][780] ([Intel XE#327])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][781] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][782] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#327]) -> [SKIP][784] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-lnl:          [SKIP][785] ([Intel XE#1437]) -> [SKIP][786] ([Intel XE#2423]) +2 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          [SKIP][787] ([Intel XE#1435]) -> [SKIP][788] ([Intel XE#2423]) +1 other test skip
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         [SKIP][789] ([Intel XE#1201]) -> [SKIP][790] ([Intel XE#1201] / [Intel XE#2168])
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_vrr@cmrr.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     [SKIP][791] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][792] ([Intel XE#1201] / [Intel XE#2168])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_vrr@cmrr.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][793] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][794] ([Intel XE#455]) +4 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_vrr@flipline.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][795] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][796] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-lnl:          [SKIP][797] ([Intel XE#756]) -> [SKIP][798] ([Intel XE#2423])
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-adlp:         [SKIP][799] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][800] ([Intel XE#1201])
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][801] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][802] ([Intel XE#1201] / [i915#2575])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          [SKIP][803] ([Intel XE#1091]) -> [SKIP][804] ([Intel XE#2423])
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][805] ([Intel XE#1091]) -> [SKIP][806] ([Intel XE#1091] / [Intel XE#1201])
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][807] ([Intel XE#1201]) -> [SKIP][808] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [FAIL][809] ([Intel XE#1050]) -> [SKIP][810] ([Intel XE#1130])
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-adlp:         [SKIP][811] ([Intel XE#1201] / [Intel XE#1447]) -> [SKIP][812] ([Intel XE#1201])
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][813] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][814] ([Intel XE#1130] / [Intel XE#1201])
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][815] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][816] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][817] ([Intel XE#1126]) -> [SKIP][818] ([Intel XE#1126] / [Intel XE#1201])
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][819] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][820] ([Intel XE#1126])
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [SKIP][821] ([Intel XE#1130] / [Intel XE#1201]) -> [TIMEOUT][822] ([Intel XE#1473] / [Intel XE#392])
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         [SKIP][823] ([Intel XE#1201]) -> [SKIP][824] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          [SKIP][825] ([Intel XE#688]) -> [SKIP][826] ([Intel XE#1130]) +6 other tests skip
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html
    - shard-adlp:         [SKIP][827] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][828] ([Intel XE#1201]) +2 other tests skip
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict@evict-beng-threads-large-multi-vm.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][829] ([Intel XE#1473] / [Intel XE#392]) -> [SKIP][830] ([Intel XE#1130])
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][831] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][832] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-adlp:         [SKIP][833] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][834] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_evict@evict-threads-large-multi-vm.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][835] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][836] ([Intel XE#1201]) +1 other test skip
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         [SKIP][837] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][838] ([Intel XE#1130] / [Intel XE#1201])
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          [SKIP][839] ([Intel XE#1130]) -> [SKIP][840] ([Intel XE#688]) +4 other tests skip
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         [SKIP][841] ([Intel XE#1201]) -> [SKIP][842] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         [SKIP][843] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][844] ([Intel XE#1201]) +8 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          [SKIP][845] ([Intel XE#1392]) -> [SKIP][846] ([Intel XE#1130]) +7 other tests skip
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          [SKIP][847] ([Intel XE#1130]) -> [SKIP][848] ([Intel XE#1392]) +3 other tests skip
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-adlp:         [SKIP][849] ([Intel XE#1201]) -> [SKIP][850] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_compute_mode@once-userptr:
    - shard-dg2-set2:     [SKIP][851] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][852] ([Intel XE#1130]) +1 other test skip
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_compute_mode@once-userptr.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_compute_mode@once-userptr.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     [SKIP][853] ([Intel XE#288]) -> [SKIP][854] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-basic.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][855] ([Intel XE#288]) -> [SKIP][856] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     [SKIP][857] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][858] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         [SKIP][859] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][860] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
    - shard-dg2-set2:     [SKIP][861] ([Intel XE#288]) -> [SKIP][862] ([Intel XE#1130]) +1 other test skip
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-adlp:         [SKIP][863] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][864] ([Intel XE#1201]) +11 other tests skip
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][865] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][866] ([Intel XE#288]) +7 other tests skip
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         [SKIP][867] ([Intel XE#1201]) -> [SKIP][868] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][869] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][870] ([Intel XE#1130] / [Intel XE#1201]) +5 other tests skip
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][871] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][872] ([Intel XE#1201] / [Intel XE#288])
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][873] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][874] ([Intel XE#1130]) +2 other tests skip
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][875] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][876] ([Intel XE#1201] / [Intel XE#2360])
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
    - shard-adlp:         [SKIP][877] ([Intel XE#1201]) -> [SKIP][878] ([Intel XE#1201] / [Intel XE#2360])
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         [SKIP][879] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][880] ([Intel XE#1201])
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - shard-lnl:          [FAIL][881] ([Intel XE#2343]) -> [SKIP][882] ([Intel XE#1130])
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][883] ([Intel XE#1192] / [Intel XE#1201]) -> [FAIL][884] ([Intel XE#1999])
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][885] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][886] ([Intel XE#1130] / [Intel XE#1201])
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_media_fill@media-fill.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_media_fill@media-fill.html
    - shard-lnl:          [SKIP][887] ([Intel XE#560]) -> [SKIP][888] ([Intel XE#1130])
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@xe_media_fill@media-fill.html
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][889] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][890] ([Intel XE#378])
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_module_load@force-load.html
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][891] -> [FAIL][892] ([Intel XE#2136])
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_module_load@many-reload.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-FAIL][893] ([Intel XE#2019]) -> [FAIL][894] ([Intel XE#1204] / [Intel XE#2136])
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@blocking:
    - shard-dg2-set2:     [SKIP][895] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][896] ([Intel XE#2419]) +2 other tests skip
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_oa@blocking.html
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_oa@blocking.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][897] ([Intel XE#2419]) -> [SKIP][898] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][899] ([Intel XE#979]) -> [SKIP][900] ([Intel XE#1201] / [Intel XE#979])
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][901] ([Intel XE#1173]) -> [SKIP][902] ([Intel XE#1061] / [Intel XE#1201])
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_peer2peer@write.html
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [SKIP][903] ([Intel XE#1130]) -> [FAIL][904] ([Intel XE#1924] / [Intel XE#2028])
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          [SKIP][905] ([Intel XE#584]) -> [SKIP][906] ([Intel XE#1130])
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          [SKIP][907] ([Intel XE#1130]) -> [SKIP][908] ([Intel XE#2284] / [Intel XE#366])
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-adlp:         [SKIP][909] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][910] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [909]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html
   [910]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][911] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][912] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [911]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html
   [912]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][913] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][914] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [913]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
   [914]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          [SKIP][915] ([Intel XE#1130]) -> [SKIP][916] ([Intel XE#944]) +1 other test skip
   [915]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_query@multigpu-query-cs-cycles.html
   [916]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-adlp:         [SKIP][917] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][918] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [917]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html
   [918]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         [SKIP][919] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][920] ([Intel XE#1130] / [Intel XE#1201]) +3 other tests skip
   [919]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html
   [920]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][921] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][922] ([Intel XE#944])
   [921]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
   [922]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][923] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][924] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [923]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
   [924]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          [SKIP][925] ([Intel XE#944]) -> [SKIP][926] ([Intel XE#1130]) +2 other tests skip
   [925]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [926]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][927] ([Intel XE#944]) -> [SKIP][928] ([Intel XE#1130])
   [927]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [928]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
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
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7951 -> IGT_7952
  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-pw-136821v1

  IGT_7951: 7951
  IGT_7952: 7952
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-pw-136821v1: 136821v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html

--===============9004759287432230100==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Introduce performance changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136821/">https://patchwork.freedesktop.org/series/136821/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_full -&gt; xe-pw-136821v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136821v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136821v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136821v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@core_getversion@basic.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-linear.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_vrr@flip-basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_plane_multiple@tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_multiple@tiling-4.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-c-hdmi-a-3.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_module_load@many-reload.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-4/igt@xe_query@multigpu-query-topology.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136821v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@core_getstats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_addfb_basic@legacy-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_addfb_basic@legacy-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_lease@lease-invalid-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_plane_alpha_blend@constant-alpha-max.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +101 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_mmap@cpu-caching.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_vm@large-misaligned-binds-2097152.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-8388608:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@xe_vm@large-misaligned-binds-8388608.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-8388608.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@xe_vm@large-split-misaligned-binds-1073741824.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-1073741824.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-protection:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_getfb@getfb-handle-protection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_getfb@getfb-handle-protection.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_hdr@bpc-switch.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@xe_ccs@block-multicopy-inplace.html">PASS</a> +52 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-5/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +83 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) +2 other tests abort</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict@evict-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_compute_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_compute_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-433/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_pm@s2idle-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-5/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-1/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-lnl-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-lnl-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7951 -&gt; IGT_7952</li>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-pw-136821v1</li>
</ul>
<p>IGT_7951: 7951<br />
  IGT_7952: 7952<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-pw-136821v1: 136821v1</p>

</body>
</html>

--===============9004759287432230100==--
