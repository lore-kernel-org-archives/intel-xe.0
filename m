Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B148C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 11:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F510E921;
	Thu,  1 Aug 2024 11:35:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5054310E921;
 Thu,  1 Aug 2024 11:35:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1813961655556193245=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe=5Fgt=5Fidle=3A_add_de?=
 =?utf-8?q?bugfs_entry_for_powergating_info_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 11:35:17 -0000
Message-ID: <172251211731.487495.12926108173323161722@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801095305.1209046-1-riana.tauro@intel.com>
In-Reply-To: <20240801095305.1209046-1-riana.tauro@intel.com>
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

--===============1813961655556193245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_gt_idle: add debugfs entry for powergating info (rev3)
URL   : https://patchwork.freedesktop.org/series/136477/
State : failure

== Summary ==

CI Bug Log - changes from xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d_full -> xe-pw-136477v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136477v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136477v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): shard-bmg 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136477v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][3] +23 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_content_protection@atomic:
    - {shard-bmg}:        NOTRUN -> [FAIL][4] +18 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        NOTRUN -> [TIMEOUT][6] +6 other tests timeout
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - {shard-bmg}:        NOTRUN -> [SKIP][7] +186 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-136477v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#324]) +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#2338])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1399]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#306])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1413])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#877]) +1 other test dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#599]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][27] ([Intel XE#1504]) +1 other test timeout
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#2028]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#1901] / [Intel XE#2028])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#1901]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp4:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_flip@flip-vs-suspend@b-dp4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1874]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#651]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#656]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][40] ([Intel XE#1861])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#2019])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#718])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1705]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1128])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1126] / [Intel XE#1201])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][54] -> [TIMEOUT][55] ([Intel XE#1473] / [Intel XE#402])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#688]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#261])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1130] / [Intel XE#1201]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201]) +51 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2419])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@polling-small-buf:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#2419])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][63] -> [ABORT][64] ([Intel XE#1358] / [Intel XE#1794])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][65] -> [ABORT][66] ([Intel XE#1794])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][67] ([Intel XE#1033]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][69] ([Intel XE#1426]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][71] ([Intel XE#1426]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][73] ([Intel XE#1874]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][75] ([Intel XE#1162]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][77] ([Intel XE#324]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][79] ([Intel XE#324]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#361]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][83] ([Intel XE#771] / [Intel XE#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][85] ([Intel XE#899]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][87] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][89] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          [FAIL][91] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][93] ([Intel XE#1358]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_pm@s4-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][95] ([Intel XE#1794]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [ABORT][97] ([Intel XE#2310]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#2134]) -> [SKIP][100] ([Intel XE#1201] / [Intel XE#2134])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@fbdev@nullptr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][102] ([Intel XE#623])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#316]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][106] ([Intel XE#316]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1204])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#610]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#610])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][111] ([Intel XE#324]) -> [FAIL][112] ([Intel XE#1231])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1124]) -> [SKIP][114] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][116] ([Intel XE#619])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][118] ([Intel XE#610])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][120] ([Intel XE#1124]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][122] ([Intel XE#346])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_big_joiner@basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#2191]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][126] ([Intel XE#367]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#367]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#787]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][134] ([Intel XE#787]) +41 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][136] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1152]) -> [SKIP][138] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][140] ([Intel XE#373]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#306]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#306])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][144] ([Intel XE#306]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#373]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][148] ([Intel XE#307])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][150] ([Intel XE#308]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#308]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#323]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#323])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][156] ([Intel XE#323])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2423] / [i915#2575]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +38 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip@busy-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][159] ([Intel XE#1551]) -> [INCOMPLETE][160] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#455]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][164] ([Intel XE#455]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2351]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#2351]) +11 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][168] ([Intel XE#651]) +21 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#651]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#653]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][174] ([Intel XE#653]) +22 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][175] -> [SKIP][176] ([Intel XE#1201]) +48 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][178] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][180] ([Intel XE#498]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][182] ([Intel XE#2318]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][184] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][186] ([Intel XE#870]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#908]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#908])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][190] ([Intel XE#1489]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1489]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1122]) -> [SKIP][194] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1122])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#929]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][200] ([Intel XE#929]) +9 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#327]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][204] ([Intel XE#756]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#756]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#756])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1123]) -> [SKIP][208] ([Intel XE#1123] / [Intel XE#1201])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][210] ([Intel XE#1126])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [FAIL][211] ([Intel XE#1000]) -> [TIMEOUT][212] ([Intel XE#1473] / [Intel XE#392])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1130]) -> [SKIP][214] ([Intel XE#1130] / [Intel XE#1201]) +76 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][216] ([Intel XE#288]) +18 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#288]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2360]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2360])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2229]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2229])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1192]) -> [SKIP][224] ([Intel XE#1192] / [Intel XE#1201])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#512]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#512])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_mmap@small-bar.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][228] ([Intel XE#2419]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_oa@mi-rpc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2419]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#2419]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][232] ([Intel XE#977])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][234] ([Intel XE#2284] / [Intel XE#366])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#944]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#944])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][238] ([Intel XE#944]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2398]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2398
  [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2428
  [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/386
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d -> xe-pw-136477v3

  IGT_7950: 7950
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d
  xe-pw-136477v3: 136477v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html

--===============1813961655556193245==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_gt_idle: add debugfs entry for powergating info (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136477/">https://patchwork.freedesktop.org/series/136477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d_full -&gt; xe-pw-136477v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136477v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136477v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): shard-bmg </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136477v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@linear-64bpp-rotate-180:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> +6 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-bmg-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> +186 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136477v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_flip@flip-vs-suspend@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-4/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-2/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d -&gt; xe-pw-136477v3</li>
</ul>
<p>IGT_7950: 7950<br />
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d<br />
  xe-pw-136477v3: 136477v3</p>

</body>
</html>

--===============1813961655556193245==--
