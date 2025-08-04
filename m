Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C2AC87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 10:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8210E0C1;
	Mon,  4 Aug 2025 10:29:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101510E0C1;
 Mon,  4 Aug 2025 10:29:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5617901592438249164=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Defer_buffer_obj?=
 =?utf-8?q?ect_shrinker_write-backs_and_GPU_waits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Aug 2025 10:29:15 -0000
Message-ID: <175430335505.209865.3949097427420605009@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250804081040.2458-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250804081040.2458-1-thomas.hellstrom@linux.intel.com>
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

--===============5617901592438249164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Defer buffer object shrinker write-backs and GPU waits
URL   : https://patchwork.freedesktop.org/series/152477/
State : failure

== Summary ==

CI Bug Log - changes from xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb_FULL -> xe-pw-152477v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152477v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152477v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152477v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@xe_exec_threads@threads-cm-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_threads@threads-cm-fd-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-152477v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#4672])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#911]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#4947]) +15 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#4543]) +7 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#607])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4950])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +125 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2907]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2669]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4417]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#307])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#455]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1508])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4302])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4354])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#2351] / [Intel XE#4208])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_fb_coherency@memset-crc.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#4422])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#301]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#301]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#4543]) +14 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#301] / [Intel XE#3321])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#4543] / [Intel XE#5208])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2380])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#455]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#651])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#651])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2312])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4947]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +15 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +14 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#656]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#4208] / [i915#2575]) +10 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_getfb@getfb2-handle-zero.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#1503])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#4298])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#5020])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2763]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1122])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#3309])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#3309])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#3309])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#718])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#4962]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_pm_rpm@basic-rte.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#4950]) +92 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2893])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1489])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4608])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1406])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@kms_psr@psr-primary-blt.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1392] / [Intel XE#5575])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1392])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#1392])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#288] / [Intel XE#5561])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#288]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2360])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#3876])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][117] ([Intel XE#3876])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4837]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@many-execqueues-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4945]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-new-nomemset.html

  * igt@xe_exec_system_allocator@once-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4208]) +12 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_exec_system_allocator@once-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4915] / [Intel XE#5560]) +14 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4915]) +127 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#4945]) +450 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#5018])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-adlp:         [PASS][127] -> [DMESG-FAIL][128] ([Intel XE#3876])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#2229])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2229])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#560])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][133] -> [FAIL][134] ([Intel XE#5679]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#3573]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#3573])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][137] ([Intel XE#1173])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#4733] / [Intel XE#5594])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#4208]) +24 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][142] ([Intel XE#5547]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][144] ([Intel XE#4665]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@intel_hwmon@hwmon-write.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1}:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#4543]) -> [PASS][147] +7 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-8/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][148] ([Intel XE#3884]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][150] ([Intel XE#4947]) -> [PASS][151] +20 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [FAIL][152] ([Intel XE#1874]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][154] ([Intel XE#4543]) -> [PASS][155] +7 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#3862]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][162] ([Intel XE#2291]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][164] ([Intel XE#2316]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][166] ([Intel XE#4950]) -> [PASS][167] +84 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][168] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#4208]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-adlp:         [DMESG-WARN][172] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][174] ([Intel XE#718]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][176] ([Intel XE#4962]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][178] ([Intel XE#4459]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1392]) -> [PASS][181] +5 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [SKIP][182] ([Intel XE#4945]) -> [PASS][183] +404 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][184] ([Intel XE#4950]) -> [SKIP][185] ([Intel XE#2233])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][186] ([Intel XE#2370]) -> [SKIP][187] ([Intel XE#4950]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][188] ([Intel XE#2327]) -> [SKIP][189] ([Intel XE#4947]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][190] ([Intel XE#4947]) -> [SKIP][191] ([Intel XE#2327]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#316]) -> [SKIP][193] ([Intel XE#2351] / [Intel XE#4208])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][194] ([Intel XE#4947]) -> [SKIP][195] ([Intel XE#607])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#610])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][198] ([Intel XE#4947]) -> [SKIP][199] ([Intel XE#2328]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1124]) -> [SKIP][201] ([Intel XE#4208]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][202] ([Intel XE#4947]) -> [SKIP][203] ([Intel XE#1124]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][204] ([Intel XE#1124]) -> [SKIP][205] ([Intel XE#4947]) +11 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][206] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][207] ([Intel XE#4950]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][208] ([Intel XE#4950]) -> [SKIP][209] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2191]) -> [SKIP][211] ([Intel XE#4208] / [i915#2575])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][212] ([Intel XE#367]) -> [SKIP][213] ([Intel XE#4950]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][215] ([Intel XE#4208]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][216] ([Intel XE#4947]) -> [SKIP][217] ([Intel XE#2887]) +15 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][218] ([Intel XE#3432]) -> [SKIP][219] ([Intel XE#4947]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][220] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][221] ([Intel XE#4947])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][222] ([Intel XE#4947]) -> [SKIP][223] ([Intel XE#3432]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][225] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][226] ([Intel XE#2887]) -> [SKIP][227] ([Intel XE#4947]) +17 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [INCOMPLETE][228] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][229] ([Intel XE#1727] / [Intel XE#3113])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][230] ([Intel XE#4947]) -> [SKIP][231] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][232] ([Intel XE#2325]) -> [SKIP][233] ([Intel XE#4950]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][234] ([Intel XE#4950]) -> [SKIP][235] ([Intel XE#2325]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][236] ([Intel XE#4950]) -> [SKIP][237] ([Intel XE#2252]) +7 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][238] ([Intel XE#2252]) -> [SKIP][239] ([Intel XE#4950]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][240] ([Intel XE#1178]) -> [SKIP][241] ([Intel XE#4950])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_content_protection@legacy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][242] ([Intel XE#1178]) -> [INCOMPLETE][243] ([Intel XE#4907]) +1 other test incomplete
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_content_protection@legacy.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][244] ([Intel XE#4950]) -> [FAIL][245] ([Intel XE#1178]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][246] ([Intel XE#1178]) -> [SKIP][247] ([Intel XE#4208] / [i915#2575])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@kms_content_protection@srm.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][248] ([Intel XE#2341]) -> [SKIP][249] ([Intel XE#4950])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_content_protection@type1.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][250] ([Intel XE#1188]) -> [SKIP][251] ([Intel XE#2341])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_content_protection@uevent.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][252] ([Intel XE#4950]) -> [SKIP][253] ([Intel XE#2321])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][254] ([Intel XE#4950]) -> [SKIP][255] ([Intel XE#2320]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][256] ([Intel XE#2320]) -> [SKIP][257] ([Intel XE#4950]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#308]) -> [SKIP][259] ([Intel XE#4208] / [i915#2575])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][260] ([Intel XE#2321]) -> [SKIP][261] ([Intel XE#4950]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][262] ([Intel XE#4950]) -> [SKIP][263] ([Intel XE#2286])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][264] ([Intel XE#4947]) -> [SKIP][265] ([Intel XE#1508])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][266] ([Intel XE#4354]) -> [SKIP][267] ([Intel XE#4947]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][268] ([Intel XE#4947]) -> [SKIP][269] ([Intel XE#2244]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][270] ([Intel XE#4422]) -> [SKIP][271] ([Intel XE#4945]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][272] ([Intel XE#5425]) -> [SKIP][273] ([Intel XE#4947])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][274] ([Intel XE#4947]) -> [SKIP][275] ([Intel XE#5425])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#776]) -> [SKIP][277] ([Intel XE#4208])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][278] ([Intel XE#4950]) -> [SKIP][279] ([Intel XE#2372])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][280] ([Intel XE#2316]) -> [SKIP][281] ([Intel XE#4950])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][282] ([Intel XE#4950]) -> [SKIP][283] ([Intel XE#2316]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][285] ([Intel XE#4543]) +1 other test dmesg-warn
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][286] ([Intel XE#4947]) -> [SKIP][287] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][288] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][289] ([Intel XE#4947]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][290] ([Intel XE#4947]) -> [SKIP][291] ([Intel XE#2380])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#455]) -> [SKIP][293] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][294] ([Intel XE#2311]) -> [SKIP][295] ([Intel XE#4947]) +30 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][296] ([Intel XE#4947]) -> [SKIP][297] ([Intel XE#2311]) +28 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][298] ([Intel XE#4947]) -> [SKIP][299] ([Intel XE#2312]) +8 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][300] ([Intel XE#2312]) -> [SKIP][301] ([Intel XE#2311])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][302] ([Intel XE#2311]) -> [SKIP][303] ([Intel XE#2312]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][304] ([Intel XE#4947]) -> [SKIP][305] ([Intel XE#5390]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][306] ([Intel XE#2312]) -> [SKIP][307] ([Intel XE#5390]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][308] ([Intel XE#5390]) -> [SKIP][309] ([Intel XE#2312]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][310] ([Intel XE#5390]) -> [SKIP][311] ([Intel XE#4947]) +16 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][312] ([Intel XE#4947]) -> [SKIP][313] ([Intel XE#2352])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#651]) -> [SKIP][315] ([Intel XE#4208]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][316] ([Intel XE#2312]) -> [SKIP][317] ([Intel XE#4947]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#651]) -> [SKIP][319] ([Intel XE#2351] / [Intel XE#4208])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][320] ([Intel XE#2313]) -> [SKIP][321] ([Intel XE#2312]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][322] ([Intel XE#4947]) -> [SKIP][323] ([Intel XE#5672])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#653]) -> [SKIP][325] ([Intel XE#4208]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][326] ([Intel XE#2313]) -> [SKIP][327] ([Intel XE#4947]) +30 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][328] ([Intel XE#4947]) -> [SKIP][329] ([Intel XE#2313]) +24 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][330] ([Intel XE#2312]) -> [SKIP][331] ([Intel XE#2313])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][332] ([Intel XE#1503]) -> [SKIP][333] ([Intel XE#4950])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][334] ([Intel XE#4947]) -> [SKIP][335] ([Intel XE#346])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2925]) -> [SKIP][337] ([Intel XE#4208])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][338] ([Intel XE#5021]) -> [SKIP][339] ([Intel XE#4596])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][340] ([Intel XE#4950]) -> [SKIP][341] ([Intel XE#2763])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][342] ([Intel XE#4947]) -> [SKIP][343] ([Intel XE#870]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][344] ([Intel XE#1909]) -> [SKIP][345] ([Intel XE#736])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][346] ([Intel XE#2392]) -> [SKIP][347] ([Intel XE#4947]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][348] ([Intel XE#2505]) -> [SKIP][349] ([Intel XE#4947])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][350] ([Intel XE#2499]) -> [SKIP][351] ([Intel XE#4947])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][352] ([Intel XE#4962]) -> [SKIP][353] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][354] ([Intel XE#4962]) -> [SKIP][355] ([Intel XE#1439] / [Intel XE#836])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][356] ([Intel XE#1489]) -> [SKIP][357] ([Intel XE#4947]) +11 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1489]) -> [SKIP][359] ([Intel XE#4208]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][360] ([Intel XE#4947]) -> [SKIP][361] ([Intel XE#1489]) +6 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][362] ([Intel XE#2387]) -> [SKIP][363] ([Intel XE#4947]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][365] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][366] ([Intel XE#4947]) -> [SKIP][367] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][369] ([Intel XE#4208])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][370] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][371] ([Intel XE#4947]) +14 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][372] ([Intel XE#4947]) -> [SKIP][373] ([Intel XE#2414])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][374] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][375] ([Intel XE#4950]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][376] ([Intel XE#4950]) -> [SKIP][377] ([Intel XE#3414] / [Intel XE#3904])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1127]) -> [SKIP][379] ([Intel XE#4208] / [i915#2575])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][380] ([Intel XE#2413]) -> [SKIP][381] ([Intel XE#4950])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][382] ([Intel XE#4950]) -> [SKIP][383] ([Intel XE#1499])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2168]) -> [SKIP][385] ([Intel XE#4208] / [i915#2575])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_vrr@lobf.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][386] ([Intel XE#4837]) -> [SKIP][387] ([Intel XE#4945]) +11 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#4837]) -> [SKIP][389] ([Intel XE#4208]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][390] ([Intel XE#4945]) -> [SKIP][391] ([Intel XE#4837]) +11 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][392] ([Intel XE#4945]) -> [SKIP][393] ([Intel XE#4518])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][394] ([Intel XE#4945]) -> [SKIP][395] ([Intel XE#2322]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][396] ([Intel XE#2322]) -> [SKIP][397] ([Intel XE#4945]) +6 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1392]) -> [SKIP][399] ([Intel XE#4208])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#288]) -> [SKIP][401] ([Intel XE#4208]) +3 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][402] ([Intel XE#4943]) -> [SKIP][403] ([Intel XE#4945]) +31 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-remap-ro:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#4915]) -> [SKIP][405] ([Intel XE#4208]) +43 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-mmap-remap-ro.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][406] ([Intel XE#4945]) -> [SKIP][407] ([Intel XE#4943]) +27 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][408] ([Intel XE#4945]) -> [ABORT][409] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][410] ([Intel XE#4945]) -> [SKIP][411] ([Intel XE#586])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_mmap@small-bar.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#5103]) -> [SKIP][413] ([Intel XE#4208])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@xe_oa@buffer-size.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@buffer-size.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#3573]) -> [SKIP][415] ([Intel XE#4208])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@xe_oa@short-reads.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@short-reads.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][416] ([Intel XE#4945]) -> [SKIP][417] ([Intel XE#2245])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1061]) -> [FAIL][419] ([Intel XE#1173])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_peer2peer@write.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][421] ([Intel XE#4208])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][422] ([Intel XE#4945]) -> [SKIP][423] ([Intel XE#5695])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][424] ([Intel XE#2284]) -> [SKIP][425] ([Intel XE#4945]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][426] ([Intel XE#4650]) -> [SKIP][427] ([Intel XE#4945])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][428] ([Intel XE#4733]) -> [SKIP][429] ([Intel XE#4945]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#944]) -> [SKIP][431] ([Intel XE#4208])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_query@multigpu-query-config.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][432] ([Intel XE#944]) -> [SKIP][433] ([Intel XE#4945]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][434] ([Intel XE#4945]) -> [SKIP][435] ([Intel XE#944]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][436] ([Intel XE#4945]) -> [SKIP][437] ([Intel XE#4130]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][438] ([Intel XE#3342]) -> [SKIP][439] ([Intel XE#4945])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [SKIP][440] ([Intel XE#4273]) -> [SKIP][441] ([Intel XE#4945])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][442] ([Intel XE#4351]) -> [SKIP][443] ([Intel XE#4945])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8482 -> IGT_8483
  * Linux: xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb -> xe-pw-152477v1

  IGT_8482: 8482
  IGT_8483: 8483
  xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb: 88abc8239a17ea427f6d6bef8f9807fde5bf7cfb
  xe-pw-152477v1: 152477v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/index.html

--===============5617901592438249164==
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
<tr><td><b>Series:</b></td><td>drm/xe: Defer buffer object shrinker write-b=
acks and GPU waits</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152477/">https://patchwork.freedesktop.org/series/152477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152477v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152477v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3499-88abc8239a17ea427f6d6bef8f9807fde=
5bf7cfb_FULL -&gt; xe-pw-152477v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152477v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152477v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1524=
77v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-cm-fd-basic:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-4/igt@xe_exec=
_threads@threads-cm-fd-basic.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_threads=
@threads-cm-fd-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152477v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@core_get=
version@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@core_getversion@all-cards.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4672">Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@fbdev@nu=
llptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152477v1/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_big_=
fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_big_fb@linear-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-6=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg=
2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#=
4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_fb=
_coherency@memset-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_fb_coherency@mems=
et-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@kms=
_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 ot=
her tests fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-9=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank@b-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_flip@fl=
ip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_fli=
p@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-9/igt@kms_flip@fli=
p-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152477v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ge=
tfb@getfb2-handle-zero.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_getfb@getfb2-han=
dle-zero.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-5/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_pm_r=
pm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">I=
ntel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_prop=
erties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_proper=
ties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +92 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@kms_psr@psr-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_universal_plane@cursor-=
fb-leak.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-8/igt@xe_exec_fault_mode@many-exec=
queues-basic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-3/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-r=
eset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpo=
int-waitsip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_exec_system_allocator@many=
-execqueues-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_exec_system_allocator@on=
ce-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eoche=
ck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE=
#5560</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-stride-free-nomemset.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-=
5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) +450 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152477v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@xe_exec=
_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_exec_=
threads@threads-bal-mixed-fd-basic.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_live_=
ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_liv=
e_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_module_load@reloa=
d-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5679">Intel XE#5679</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-3/igt@xe_oa@oa-unit-exclusive-stre=
am-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152477v1/shard-adlp-2/igt@xe_pxp@pxp-termination-key-u=
pdate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_vm@=
mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_vm@m=
map-style-bind-userptr-one-partial.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +24 other t=
ests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@device_r=
eset@unbind-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5547">Intel XE#5547</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@device=
_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-dpms@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/=
shard-adlp-1/igt@kms_async_flips@async-flip-dpms@pipe-c-hdmi-a-1.html">PASS=
</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-adlp-=
1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-asy=
nc-flip.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-=
adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152477v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-434/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-panning-vs-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-9/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152477v1/shard-adlp-4/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-1/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms=
_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-3/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-8/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +5 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel X=
E#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152477v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> +404 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-=
8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg=
-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152477v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152477v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/sh=
ard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard=
-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/s=
hard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477=
v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152477v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg=
-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-432/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_chamel=
ium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shar=
d-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">In=
tel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-466/igt@kms_c=
ontent_protection@legacy.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4907">Intel XE#4907</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/ig=
t@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@km=
s_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@=
kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/=
shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1=
/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_fbcon_f=
bt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-=
bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/s=
hard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152477v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152477v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@k=
ms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152477v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2477v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-d=
g2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg=
-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-4/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-lnl-7/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_pm_rpm@dpms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/sh=
ard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2=
-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard=
-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ps=
r@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/=
igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-=
dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5=
/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/sha=
rd-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_rota=
tion_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-7/igt@kms_rotatio=
n_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-d=
g2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@kms_vrr@=
flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-3/igt@kms_vrr@flip-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@kms_vrr@lobf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-463/igt@xe_eud=
ebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shar=
d-dg2-433/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_eudeb=
ug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-1/igt@xe_eud=
ebug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@xe_eudebug_=
sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
477v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-7/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-=
433/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/s=
hard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
77v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4945">Intel XE#4945</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap-ro:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-many-mmap-remap-ro.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/s=
hard-dg2-433/igt@xe_exec_system_allocator@threads-many-mmap-remap-ro.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152477v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-v=
m-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +27 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/s=
hard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-2/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-433/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-464/igt@xe_oa@=
short-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_oa@short-reads=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-436/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-434/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569=
5">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@x=
e_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-dg2-436/igt@xe_que=
ry@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-dg2-433/igt@xe_que=
ry@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-8/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_query=
@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-8/i=
gt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52477v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-4/igt@xe_sriov=
_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_srio=
v_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-3/igt@xe_sriov=
_flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe_sriov_=
flr@flr-vfs-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb/shard-bmg-1/igt@xe_sriov=
_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152477v1/shard-bmg-5/igt@xe=
_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8482 -&gt; IGT_8483</li>
<li>Linux: xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb -&gt; xe-pw-152=
477v1</li>
</ul>
<p>IGT_8482: 8482<br />
  IGT_8483: 8483<br />
  xe-3499-88abc8239a17ea427f6d6bef8f9807fde5bf7cfb: 88abc8239a17ea427f6d6be=
f8f9807fde5bf7cfb<br />
  xe-pw-152477v1: 152477v1</p>

</body>
</html>

--===============5617901592438249164==--
