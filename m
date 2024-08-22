Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49FC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 04:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC7810E497;
	Thu, 22 Aug 2024 04:32:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34B110E497;
 Thu, 22 Aug 2024 04:32:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1111473613461387671=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B01/12?=
 =?utf-8?q?=5D_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 04:32:17 -0000
Message-ID: <172430113784.723840.13942202495054998614@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
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

--===============1111473613461387671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137588/
State : failure

== Summary ==

CI Bug Log - changes from xe-1807-ddbda36f876f53498924155abfa1cd4c58517903_full -> xe-pw-137588v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137588v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137588v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137588v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@forked-bo:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-lnl:          [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_draw_crc@draw-method-blt.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [FAIL][6] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-lnl:          [PASS][7] -> [CRASH][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [ABORT][9] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-lnl:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][13] ([Intel XE#1407]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          [SKIP][15] ([Intel XE#1124]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [ABORT][17] ([Intel XE#2583]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-lnl:          [ABORT][19] ([Intel XE#2583]) -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][21] ([Intel XE#656]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [ABORT][23] ([Intel XE#2583]) -> [ABORT][24] +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-busy-flip:
    - {shard-bmg}:        [DMESG-WARN][25] ([Intel XE#877]) -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_flip@2x-busy-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][27] -> [ABORT][28] +2 other tests abort
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][29] +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][30] ([Intel XE#1473]) -> [DMESG-FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  
Known issues
------------

  Here are the changes found in xe-pw-137588v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#1033]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#1426]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1407])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1467])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124] / [Intel XE#1201])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1399]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#306])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#307])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178] / [Intel XE#1204])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1204])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1468])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1424])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#309]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1508] / [Intel XE#599])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#702])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1421])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1401]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#651]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#656]) +17 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1469]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +10 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#653])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][77] -> [DMESG-FAIL][78] ([Intel XE#324]) +1 other test dmesg-fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          NOTRUN -> [ABORT][79] ([Intel XE#2583]) +7 other tests abort
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#599]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2318]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#1489])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1122] / [Intel XE#1201])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#929])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][91] ([Intel XE#1874])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1127] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1123] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1126] / [Intel XE#1201])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][96] -> [INCOMPLETE][97] ([Intel XE#1195] / [Intel XE#1473])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#688]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#1000]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1392]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-lnl:          [PASS][104] -> [ABORT][105] ([Intel XE#2583]) +2 other tests abort
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2229])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#512])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][109] -> [TIMEOUT][110] ([Intel XE#1961] / [Intel XE#2026])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-6/igt@xe_module_load@many-reload.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-6/igt@xe_module_load@many-reload.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1061])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][114] ([Intel XE#1551] / [Intel XE#569])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][115] -> [ABORT][116] ([Intel XE#1358] / [Intel XE#1607])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-1/igt@xe_pm@s4-basic.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][117] -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
    - shard-lnl:          [PASS][119] -> [ABORT][120] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][121] -> [ABORT][122] ([Intel XE#1794])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-8/igt@xe_pm@s4-mocs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][123] -> [ABORT][124] ([Intel XE#1607] / [Intel XE#1794])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#944])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][126] ([Intel XE#1760])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][127] ([Intel XE#1659]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - {shard-bmg}:        [ABORT][129] ([Intel XE#2583]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][131] ([Intel XE#886]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][133] ([Intel XE#2597]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][135] ([Intel XE#2583]) -> [PASS][136] +6 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#2019]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - {shard-bmg}:        [DMESG-WARN][139] ([Intel XE#877]) -> [PASS][140] +9 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [INCOMPLETE][141] -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-4/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-2/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1195]) -> [PASS][144] +3 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][145] ([Intel XE#718]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#771] / [Intel XE#899]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#899]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][151] ([Intel XE#1473]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][153] ([Intel XE#1473]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-rebind-prefetch:
    - shard-lnl:          [ABORT][155] ([Intel XE#2583] / [Intel XE#2587]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:
    - shard-dg2-set2:     [DMESG-WARN][157] -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][159] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][161] ([Intel XE#1794]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][163] ([Intel XE#958]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@query-engines:
    - shard-lnl:          [ABORT][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-4/igt@xe_query@query-engines.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][168] ([Intel XE#623])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#316]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][172] ([Intel XE#316]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#324]) -> [FAIL][174] ([Intel XE#1231])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][175] ([Intel XE#1231]) -> [DMESG-FAIL][176] ([Intel XE#324]) +1 other test dmesg-fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1124]) -> [SKIP][178] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1124]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][182] ([Intel XE#619]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#607]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#607])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][186] ([Intel XE#2191]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#367]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][190] ([Intel XE#367]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#787]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][196] ([Intel XE#787]) +62 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#314]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1152]) -> [SKIP][202] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#373]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][206] ([Intel XE#373]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][208] ([Intel XE#307])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][209] -> [ABORT][210] ([Intel XE#2583])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#323]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#323])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#455]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][216] ([Intel XE#776])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][218] ([Intel XE#1135])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-busy-flip:
    - shard-lnl:          [SKIP][219] ([Intel XE#1421]) -> [ABORT][220] ([Intel XE#2583])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_flip@2x-busy-flip.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_flip@2x-busy-flip.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][222] ([Intel XE#651]) +19 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#651]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][226] ([Intel XE#658])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#653]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][230] ([Intel XE#653]) +17 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][232] ([Intel XE#605])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2318]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][240] ([Intel XE#870])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#870]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [ABORT][243] ([Intel XE#2583]) -> [SKIP][244] ([Intel XE#1439])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1489]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][248] ([Intel XE#1489]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#929]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][252] ([Intel XE#929]) +8 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#327]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#327])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][256] ([Intel XE#2168])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_vrr@cmrr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][258] ([Intel XE#756]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#756]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#756])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1123]) -> [SKIP][262] ([Intel XE#1123] / [Intel XE#1201])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-lnl:          [ABORT][263] ([Intel XE#2583]) -> [SKIP][264] ([Intel XE#1392])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#288]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][268] ([Intel XE#288]) +15 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][270] ([Intel XE#2360])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#255]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#255])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#560]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#560])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][276] ([Intel XE#512])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@xe_mmap@small-bar.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][278] ([Intel XE#378])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][280] ([Intel XE#2541]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_oa@buffer-fill.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2541]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_oa@mi-rpc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_oa@mi-rpc.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#977]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#977])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][288] ([Intel XE#2284] / [Intel XE#366])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#944]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][292] ([Intel XE#944])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583
  [Intel XE#2587]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2587
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1807-ddbda36f876f53498924155abfa1cd4c58517903 -> xe-pw-137588v1

  IGT_7982: 76ebe4ecfa1757f21e3f1d3be5993088a92cd274 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1807-ddbda36f876f53498924155abfa1cd4c58517903: ddbda36f876f53498924155abfa1cd4c58517903
  xe-pw-137588v1: 137588v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/index.html

--===============1111473613461387671==
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
<tr><td><b>Series:</b></td><td>series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137588/">https://patchwork.freedesktop.org/series/137588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1807-ddbda36f876f53498924155abfa1cd4c58517903_full -&gt; xe-pw-137588v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137588v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137588v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137588v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_cursor_legacy@forked-bo.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_draw_crc@draw-method-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_draw_crc@draw-method-blt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_getfb@getfb2-handle-not-fb.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_flip@2x-busy-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_flip@2x-busy-flip.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_flip@2x-busy-flip@cd-dp2-hdmi-a3.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137588v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_plane_cursor@primary.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-6/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-6/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-4/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-2/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2587">Intel XE#2587</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-4/igt@xe_query@query-engines.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_query@query-engines.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-6/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-5/igt@kms_flip@2x-busy-flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583">Intel XE#2583</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1807-ddbda36f876f53498924155abfa1cd4c58517903/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137588v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1807-ddbda36f876f53498924155abfa1cd4c58517903 -&gt; xe-pw-137588v1</li>
</ul>
<p>IGT_7982: 76ebe4ecfa1757f21e3f1d3be5993088a92cd274 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1807-ddbda36f876f53498924155abfa1cd4c58517903: ddbda36f876f53498924155abfa1cd4c58517903<br />
  xe-pw-137588v1: 137588v1</p>

</body>
</html>

--===============1111473613461387671==--
