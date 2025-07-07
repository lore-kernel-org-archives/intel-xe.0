Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684AFC71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 19:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAA910E546;
	Mon,  7 Jul 2025 19:19:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731610E52F;
 Mon,  7 Jul 2025 19:19:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8033534876940445617=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/gem=3A_Fix_race_in_drm=5Fgem=5Fhandle=5Fcreate=5Ftail=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simona Vetter" <simona.vetter@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 19:19:28 -0000
Message-ID: <175191596866.141547.11204821356807389215@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
In-Reply-To: <20250707151814.603897-1-simona.vetter@ffwll.ch>
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

--===============8033534876940445617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/gem: Fix race in drm_gem_handle_create_tail()
URL   : https://patchwork.freedesktop.org/series/151277/
State : success

== Summary ==

CI Bug Log - changes from xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3_FULL -> xe-pw-151277v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-151277v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] ([Intel XE#4208])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@fbdev@eof.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4543]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#4208] / [i915#2575]) +70 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#3862]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +167 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2291]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2316]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#301]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][30] -> [DMESG-FAIL][31] ([Intel XE#4543]) +1 other test dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#4208]) +138 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#1503])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#2883]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#1392]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#4915]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4208]) +44 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][46] ([Intel XE#2134]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@fbdev@info.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@fbdev@info.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     [SKIP][48] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][50] ([Intel XE#4543]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [DMESG-WARN][52] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][53] +3 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][54] ([Intel XE#4208] / [i915#2575]) -> [PASS][55] +60 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][56] ([Intel XE#2291]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][58] ([Intel XE#4294]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [FAIL][60] ([Intel XE#3098]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][62] ([Intel XE#2316]) -> [PASS][63] +6 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][64] ([Intel XE#301]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][67] +7 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][68] ([Intel XE#4596]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][70] ([Intel XE#2571]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][72] ([Intel XE#2883]) -> [PASS][73] +5 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-2/igt@kms_setmode@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][74] ([Intel XE#1435]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][76] ([Intel XE#3876]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][78] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#2229]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#4208]) -> [PASS][83] +145 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#623]) -> [SKIP][85] ([Intel XE#4208] / [i915#2575])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#4208] / [i915#2575]) -> [SKIP][87] ([Intel XE#3768])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#4208]) -> [SKIP][89] ([Intel XE#316]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][91] ([Intel XE#316]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#316]) -> [SKIP][93] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#316]) -> [SKIP][95] ([Intel XE#4208]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1124]) -> [SKIP][97] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][99] ([Intel XE#1124]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#4208]) -> [SKIP][101] ([Intel XE#1124]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1124]) -> [SKIP][103] ([Intel XE#4208]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#4208] / [i915#2575]) -> [SKIP][105] ([Intel XE#2191]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#367]) -> [SKIP][107] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#4208] / [i915#2575]) -> [SKIP][109] ([Intel XE#367]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][111] ([Intel XE#4208]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][113] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [SKIP][117] ([Intel XE#4208])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#4208]) -> [SKIP][119] ([Intel XE#2907]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#4208]) -> [SKIP][121] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#306]) -> [SKIP][123] ([Intel XE#4208] / [i915#2575])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#373]) -> [SKIP][125] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#4208] / [i915#2575]) -> [SKIP][127] ([Intel XE#373]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#307]) -> [SKIP][129] ([Intel XE#4208] / [i915#2575])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][130] ([Intel XE#1178]) -> [SKIP][131] ([Intel XE#4208] / [i915#2575])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#4208] / [i915#2575]) -> [FAIL][133] ([Intel XE#1178])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_content_protection@srm.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#4208] / [i915#2575]) -> [SKIP][135] ([Intel XE#308])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#455]) -> [SKIP][137] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#308]) -> [SKIP][139] ([Intel XE#4208] / [i915#2575])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#4208] / [i915#2575]) -> [SKIP][141] ([Intel XE#455]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][143] ([Intel XE#455])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#4208]) -> [SKIP][145] ([Intel XE#455]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#4422]) -> [SKIP][147] ([Intel XE#4208])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#4208] / [i915#2575]) -> [SKIP][149] ([Intel XE#1135])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#455]) -> [SKIP][151] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#455]) -> [SKIP][153] ([Intel XE#4208])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#4208]) -> [SKIP][155] ([Intel XE#651]) +14 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#2311]) +9 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][159] ([Intel XE#651]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][160] ([Intel XE#2312]) -> [SKIP][161] ([Intel XE#5390]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][162] ([Intel XE#5390]) -> [SKIP][163] ([Intel XE#2312]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#651]) -> [SKIP][165] ([Intel XE#4208]) +16 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#651]) -> [SKIP][167] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#2311]) -> [SKIP][169] ([Intel XE#2312]) +9 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#4208]) -> [SKIP][171] ([Intel XE#653]) +16 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#2312]) -> [SKIP][173] ([Intel XE#2313]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#653]) -> [SKIP][175] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1158]) -> [SKIP][177] ([Intel XE#4208])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][178] ([Intel XE#2313]) -> [SKIP][179] ([Intel XE#2312]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][181] ([Intel XE#653]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#653]) -> [SKIP][183] ([Intel XE#4208]) +17 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#346]) -> [SKIP][185] ([Intel XE#4208])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2927]) -> [SKIP][187] ([Intel XE#4208])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#4208] / [i915#2575]) -> [SKIP][189] ([Intel XE#5021])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#4208] / [i915#2575]) -> [SKIP][191] ([Intel XE#5020])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#4208]) -> [SKIP][193] ([Intel XE#2938])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#908]) -> [SKIP][195] ([Intel XE#4208])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#4208]) -> [SKIP][197] ([Intel XE#1489]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1489]) -> [SKIP][199] ([Intel XE#4208]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1122]) -> [SKIP][201] ([Intel XE#4208])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#4208]) -> [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][205] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][207] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][209] ([Intel XE#4208]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#4208] / [i915#2575]) -> [SKIP][211] ([Intel XE#3414]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208] / [i915#2575]) -> [SKIP][213] ([Intel XE#1127]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#362]) -> [FAIL][215] ([Intel XE#1729])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][216] ([Intel XE#2509]) -> [SKIP][217] ([Intel XE#2426])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1500]) -> [SKIP][219] ([Intel XE#4208] / [i915#2575])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][221] ([Intel XE#4208]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#5419]) -> [SKIP][223] ([Intel XE#4208])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_eu_stall@blocking-read.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208]) -> [SKIP][225] ([Intel XE#5419]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208]) -> [SKIP][227] ([Intel XE#4837]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#4837]) -> [SKIP][229] ([Intel XE#4208]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_eudebug_online@single-step.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1392]) -> [SKIP][231] ([Intel XE#4208]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#4208]) -> [SKIP][233] ([Intel XE#288]) +17 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#288]) -> [SKIP][235] ([Intel XE#4208]) +16 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2360]) -> [SKIP][237] ([Intel XE#4208]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#4208]) -> [SKIP][239] ([Intel XE#2360])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#4915]) -> [SKIP][241] ([Intel XE#4208]) +183 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#4208]) -> [SKIP][243] ([Intel XE#4915]) +195 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-new-nomemset.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-stride-new-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#4208]) -> [ABORT][245] ([Intel XE#4917])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [SKIP][247] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#4208]) -> [SKIP][249] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][251] ([Intel XE#4208]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][253] ([Intel XE#4208]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#977]) -> [SKIP][255] ([Intel XE#4208])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][256] ([Intel XE#1173]) -> [SKIP][257] ([Intel XE#1061])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@xe_peer2peer@read.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#4208]) -> [SKIP][259] ([Intel XE#2284] / [Intel XE#366])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#4208]) -> [SKIP][261] ([Intel XE#2284])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@d3cold-mocs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#4733]) -> [SKIP][263] ([Intel XE#4208]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#4208]) -> [SKIP][265] ([Intel XE#4733])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#944]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#944]) -> [SKIP][269] ([Intel XE#4208]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4814]) -> [SKIP][271] ([Intel XE#4208])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4130]) -> [SKIP][273] ([Intel XE#4208])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [SKIP][275] ([Intel XE#4130])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#4208]) -> [SKIP][277] ([Intel XE#3342])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#3342]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3 -> xe-pw-151277v1

  IGT_8445: 8445
  xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3: acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3
  xe-pw-151277v1: 151277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/index.html

--===============8033534876940445617==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/gem: Fix race=
 in drm_gem_handle_create_tail()</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151277/">https://patchwork.freedesktop.org/series/151277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151277v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3=
bb15ea3_FULL -&gt; xe-pw-151277v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151277v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@core_s=
etmaster@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@core_setmaste=
r@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@fbdev@=
eof.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151277v1/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-9/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp=
-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-=
dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg=
2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2=
-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-5/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip@blocking-wf_vblank=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-435/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-2/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp-6/igt@kms_flip_tiling@=
flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-d=
g2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sha=
rd-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-lnl-1/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151277v1/shard-lnl-3/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@xe_exec=
_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-adlp-9/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +44 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@fbdev@info.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/461=
8">Intel XE#4618</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151277v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-=
all-entries-display-off.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151277v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-adlp-8/igt@kms_cur=
sor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#417=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
277v1/shard-adlp-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151277v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-tran=
sitions.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-b=
mg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-8/igt@kms_fli=
p@2x-plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-=
1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> +6 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-pri-indfb-draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-2/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-2/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-4/igt@kms_setmode@basic.htm=
l">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-1/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-bmg-6/igt@x=
e_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_liv=
e_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_=
live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_liv=
e_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-46=
4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@=
s2idle-exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@s2idl=
e-exec-after.html">PASS</a> +145 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-=
466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">=
Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sha=
rd-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms=
_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@k=
ms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sh=
ard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1277v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151277v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151277v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-43=
6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277=
v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-=
433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_chame=
lium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_chamel=
ium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/=
igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-46=
4/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sh=
ard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt=
@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt=
@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/=
shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ds=
c@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sha=
rd-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_dsc@dsc-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-46=
4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151277v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151277v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151277v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151277v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
277v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-=
436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-d=
g2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-=
464/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151277v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151277v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@kms_=
psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ps=
r@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@km=
s_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard=
-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-=
dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2=
-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1277v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151277v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/s=
hard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-=
dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_eu_=
stall@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5419">Intel XE#5419</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_eu_sta=
ll@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_eud=
ebug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_eu=
debug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151277v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@=
xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-=
dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/=
shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-mlock.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v=
1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-stride-new-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-stride-new-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4915">Intel XE#4915</a>) +195 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1=
/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-43=
3/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_oa@=
syncs-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_oa@sync=
s-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_oa@=
syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
77v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#357=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
277v1/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-432/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-466/igt@xe_pat@pat-index=
-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-463/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-464/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-=
dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel =
XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-4=
33/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436=
/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-=
436/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151277v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-436/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-433/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3/shard-dg2-434/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151277v1/shard-dg2-436/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3 -&gt; xe-pw-151=
277v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3364-acdbd0bc4c8890433e1bf8a3ad6ab96c3bb15ea3: acdbd0bc4c8890433e1bf8a=
3ad6ab96c3bb15ea3<br />
  xe-pw-151277v1: 151277v1</p>

</body>
</html>

--===============8033534876940445617==--
