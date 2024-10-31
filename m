Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA110D767FA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 19:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807A310E917;
	Thu, 31 Oct 2024 19:37:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690FC10E917;
 Thu, 31 Oct 2024 19:37:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3073871512817355353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Add_functions_to_save_and?=
 =?utf-8?q?_restore_VF_LMEM_and_CCS_data_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 19:37:45 -0000
Message-ID: <173040346541.1385523.17705230748903591463@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
In-Reply-To: <20241031151725.28315-1-lukasz.laguna@intel.com>
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

--===============3073871512817355353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add functions to save and restore VF LMEM and CCS data (rev2)
URL   : https://patchwork.freedesktop.org/series/140050/
State : failure

== Summary ==

CI Bug Log - changes from xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932_full -> xe-pw-140050v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140050v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140050v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140050v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html

  
Known issues
------------

  Here are the changes found in xe-pw-140050v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1701]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +27 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#787]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2907])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1195] / [Intel XE#1727])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1195] / [Intel XE#1727])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195] / [Intel XE#3113] / [Intel XE#3124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#307]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#1195] / [Intel XE#2715]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#308]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#309])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#323])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#1541])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1508])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([i915#3804])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455]) +12 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1135])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#301]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#886]) +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#656]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#653]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#656]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#653]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2313]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#2622])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1195]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#2566] / [Intel XE#2929])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#2929])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1122])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1129])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#3184]) +1 other test dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][61] -> [ABORT][62] ([Intel XE#2625]) +2 other tests abort
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][63] ([Intel XE#2864]) +1 other test incomplete
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1489]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_psr@psr-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1127])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#362])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2426])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#899])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@wait-idle:
    - shard-adlp:         [PASS][72] -> [DMESG-WARN][73] ([Intel XE#3086])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-3/igt@kms_vblank@wait-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-1/igt@kms_vblank@wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#756])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1123])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#2905])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2905]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#1600])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473] / [Intel XE#2472])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1392])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#3160]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#3320])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#3160]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#288]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#288]) +12 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#2249])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][91] ([Intel XE#2249])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2541]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][93] ([Intel XE#2514])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][94] -> [DMESG-WARN][95] ([Intel XE#2953] / [Intel XE#3086])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][96] -> [ABORT][97] ([Intel XE#1358] / [Intel XE#1607])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@xe_pm@s4-exec-after.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][98] -> [ABORT][99] ([Intel XE#1794])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][100] -> [ABORT][101] ([Intel XE#1794])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][102] -> [FAIL][103] ([Intel XE#958])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#944]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][105] ([Intel XE#2919])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][106] ([Intel XE#1426]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#877]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [DMESG-WARN][110] ([Intel XE#3086]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          [FAIL][112] ([Intel XE#2577]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][114] ([Intel XE#301]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][116] ([Intel XE#2625]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][118] -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [FAIL][120] ([Intel XE#886]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#301]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][124] ([Intel XE#2597]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][126] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][128] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#455]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][132] ([Intel XE#616]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-433/igt@kms_plane_cursor@viewport.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][134] ([Intel XE#2029]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][136] ([Intel XE#2042]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-lnl:          [DMESG-WARN][138] ([Intel XE#3184]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-68.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][140] ([Intel XE#899]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][142] ([Intel XE#2443]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][144] ([Intel XE#1473]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][146] ([Intel XE#3160]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][148] ([Intel XE#3160]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-lnl:          [FAIL][150] -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][152] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [ABORT][154] ([Intel XE#1358]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s3-exec-after.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [ABORT][156] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][158] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@xe_pm@s4-basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][160] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][162] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][163] ([Intel XE#3194])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][164] -> [FAIL][165] ([Intel XE#1231] / [Intel XE#1242])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][166] ([Intel XE#1178]) -> [INCOMPLETE][167] ([Intel XE#2715]) +1 other test incomplete
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@kms_content_protection@legacy.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][168] ([Intel XE#1035]) -> [INCOMPLETE][169] ([Intel XE#1035] / [Intel XE#1195]) +1 other test incomplete
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-3/igt@kms_plane@pixel-format.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-1/igt@kms_plane@pixel-format.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932 -> xe-pw-140050v2

  IGT_8091: 8091
  xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932: 9c4962db90300e1d8daca8ed54195bc31d0ee932
  xe-pw-140050v2: 140050v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/index.html

--===============3073871512817355353==
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
<tr><td><b>Series:</b></td><td>PF: Add functions to save and restore VF LMEM and CCS data (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140050/">https://patchwork.freedesktop.org/series/140050/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932_full -&gt; xe-pw-140050v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140050v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140050v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140050v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140050v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-3/igt@kms_vblank@wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-1/igt@kms_vblank@wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-466/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-433/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-433/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-68.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-435/igt@xe_pm@s3-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-bmg-6/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v2/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932 -&gt; xe-pw-140050v2</li>
</ul>
<p>IGT_8091: 8091<br />
  xe-2152-9c4962db90300e1d8daca8ed54195bc31d0ee932: 9c4962db90300e1d8daca8ed54195bc31d0ee932<br />
  xe-pw-140050v2: 140050v2</p>

</body>
</html>

--===============3073871512817355353==--
