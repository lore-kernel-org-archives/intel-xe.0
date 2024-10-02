Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46878CF6D2C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 14:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A8610E75B;
	Wed,  2 Oct 2024 14:15:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1570D10E75A;
 Wed,  2 Oct 2024 14:15:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8399800625801326117=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Mark_dpt_requiring_8K?=
 =?utf-8?q?_alignment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 14:15:18 -0000
Message-ID: <172787851807.1163714.15861355750100489645@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002114815.1970048-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241002114815.1970048-1-juhapekka.heikkila@gmail.com>
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

--===============8399800625801326117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Mark dpt requiring 8K alignment
URL   : https://patchwork.freedesktop.org/series/139418/
State : failure

== Summary ==

CI Bug Log - changes from xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd_full -> xe-pw-139418v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139418v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139418v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139418v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][4] -> [ABORT][5] +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-lnl:          [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [INCOMPLETE][12] ([Intel XE#1195]) -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:
    - {shard-bmg}:        [PASS][14] -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-2/igt@kms_async_flips@test-time-stamp@pipe-a-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-6/igt@kms_async_flips@test-time-stamp@pipe-a-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-139418v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#827]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1426]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +13 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1195]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#599])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#308])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#1475]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#310])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][38] ([Intel XE#2049]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#886]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401] / [Intel XE#1745])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1401])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#651]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#651])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#656]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#1861])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#653]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#656]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#653]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1616]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#324]) +1 other test dmesg-fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1471] / [Intel XE#1874])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane_cursor@primary.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#1874])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1489])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1489]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1122])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2850])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#2850])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr@psr-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1499] / [Intel XE#599])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1062])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#2905])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2905])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#688])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1392])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1392])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][72] ([Intel XE#1195])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#288]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#288]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][75] -> [DMESG-FAIL][76] ([Intel XE#1620])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_gt_freq@throttle_basic_api:
    - shard-adlp:         [PASS][77] -> [FAIL][78] ([Intel XE#2810])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-6/igt@xe_gt_freq@throttle_basic_api.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_gt_freq@throttle_basic_api.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2541])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][80] ([Intel XE#2723]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][81] ([Intel XE#2514])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2541])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@xe_oa@rc6-disable.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [PASS][83] -> [INCOMPLETE][84] ([Intel XE#1358])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@xe_pm@s2idle-exec-after.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#1794])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#944])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][89] ([Intel XE#1426]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#1426]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - {shard-bmg}:        [FAIL][93] ([Intel XE#1659]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:
    - shard-lnl:          [TIMEOUT][95] -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [FAIL][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][99] ([Intel XE#877]) -> [PASS][100] +7 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - {shard-bmg}:        [ABORT][101] ([Intel XE#2899]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][103] ([Intel XE#886]) -> [PASS][104] +8 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][105] ([Intel XE#324]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#1195]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_pm_rpm@cursor:
    - shard-lnl:          [DMESG-FAIL][109] ([Intel XE#1620]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_pm_rpm@cursor.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_pm_rpm@cursor.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][111] ([Intel XE#2443]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-6/igt@kms_vrr@flip-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
    - shard-lnl:          [INCOMPLETE][113] ([Intel XE#2760]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [FAIL][115] -> [PASS][116] +6 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-idle.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-2/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][117] ([Intel XE#1473]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_oa@oa-exponents:
    - {shard-bmg}:        [FAIL][121] ([Intel XE#2723]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@xe_oa@oa-exponents.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-1/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [TIMEOUT][123] ([Intel XE#1358] / [Intel XE#1620]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][125] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][127] ([Intel XE#1794]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@shared-pde3-page:
    - shard-lnl:          [INCOMPLETE][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@xe_vm@shared-pde3-page.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_vm@shared-pde3-page.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][131] ([Intel XE#1231]) -> [DMESG-FAIL][132] ([Intel XE#324])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][133] ([Intel XE#2049] / [Intel XE#2597]) -> [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][135] ([Intel XE#2049]) -> [INCOMPLETE][136] ([Intel XE#1195] / [Intel XE#2049])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][137] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][138] ([Intel XE#1035])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_plane@pixel-format.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][139] ([Intel XE#324]) -> [DMESG-FAIL][140] ([Intel XE#324])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_plane@plane-position-hole.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760
  [Intel XE#2810]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2810
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd -> xe-pw-139418v1

  IGT_8048: 4ade707fbd17f6300b8c444e2d86216005f199e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd: ccd6d671492e28746e9ed8e88bd6d25b6f3295dd
  xe-pw-139418v1: 139418v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/index.html

--===============8399800625801326117==
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
<tr><td><b>Series:</b></td><td>drm/xe: Mark dpt requiring 8K alignment</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139418/">https://patchwork.freedesktop.org/series/139418/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd_full -&gt; xe-pw-139418v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139418v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139418v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139418v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_psr@psr2-suspend@edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-2/igt@kms_async_flips@test-time-stamp@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-6/igt@kms_async_flips@test-time-stamp@pipe-a-dp-2.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139418v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@throttle_basic_api:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-6/igt@xe_gt_freq@throttle_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_gt_freq@throttle_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2810">Intel XE#2810</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2899">Intel XE#2899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@kms_pm_rpm@cursor.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-8/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-6/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760">Intel XE#2760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-7/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-2/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-7/igt@xe_exec_compute_mode@once-userptr-invalidate.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-bmg-4/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-bmg-1/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde3-page:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-2/igt@xe_vm@shared-pde3-page.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-6/igt@xe_vm@shared-pde3-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139418v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd -&gt; xe-pw-139418v1</li>
</ul>
<p>IGT_8048: 4ade707fbd17f6300b8c444e2d86216005f199e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2003-ccd6d671492e28746e9ed8e88bd6d25b6f3295dd: ccd6d671492e28746e9ed8e88bd6d25b6f3295dd<br />
  xe-pw-139418v1: 139418v1</p>

</body>
</html>

--===============8399800625801326117==--
