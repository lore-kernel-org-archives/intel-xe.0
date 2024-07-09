Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7DFC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 21:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DDE10E672;
	Tue,  9 Jul 2024 21:40:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483C10E672;
 Tue,  9 Jul 2024 21:40:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5740192679213592509=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_Update_page_fault_queue_size_ca?=
 =?utf-8?q?lculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 21:40:07 -0000
Message-ID: <172056120720.87679.11412484512705571082@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720550129.git.stuart.summers@intel.com>
In-Reply-To: <cover.1720550129.git.stuart.summers@intel.com>
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

--===============5740192679213592509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update page fault queue size calculation
URL   : https://patchwork.freedesktop.org/series/135915/
State : success

== Summary ==

CI Bug Log - changes from xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee_full -> xe-pw-135915v1_full
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

  Here are the unknown changes that may have been introduced in xe-pw-135915v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@hotreplug:
    - {shard-lnl}:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-4/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-2/igt@core_hotunplug@hotreplug.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - {shard-lnl}:        NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - {shard-lnl}:        [PASS][4] -> [ABORT][5] +5 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@xe_exec_threads@threads-fd-userptr:
    - {shard-lnl}:        [PASS][6] -> [DMESG-WARN][7] +128 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-6/igt@xe_exec_threads@threads-fd-userptr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-4/igt@xe_exec_threads@threads-fd-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-135915v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][8] -> [FAIL][9] ([Intel XE#827]) +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1033] / [Intel XE#1214])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#873])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#616]) +8 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#308])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#309])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#323])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][30] ([Intel XE#324]) +1 other test dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1874]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1162] / [Intel XE#1214])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#361])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#1489])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1874]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#330])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1932])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1126] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1062] / [Intel XE#1201])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][54] -> [TIMEOUT][55] ([Intel XE#1473] / [Intel XE#392])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#261])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#358])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#2203])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@xe_gt_freq@freq_range_exec.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][66] -> [TIMEOUT][67] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-6/igt@xe_module_load@many-reload.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#366])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - {shard-lnl}:        [FAIL][73] ([Intel XE#886]) -> [PASS][74] +3 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][75] ([Intel XE#1874]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#1214]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][79] ([Intel XE#1035] / [Intel XE#1195]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_plane@pixel-format.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_plane@pixel-format.html

  * {igt@kms_plane@pixel-format@pipe-b-plane-0}:
    - shard-dg2-set2:     [INCOMPLETE][81] ([Intel XE#1195]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - {shard-lnl}:        [INCOMPLETE][83] -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * {igt@kms_plane@plane-position-hole@pipe-a-plane-3}:
    - {shard-lnl}:        [DMESG-FAIL][85] ([Intel XE#324]) -> [PASS][86] +2 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * {igt@kms_plane@plane-position-hole@pipe-b-plane-3}:
    - {shard-lnl}:        [DMESG-WARN][87] ([Intel XE#324]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][89] ([Intel XE#2058]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#361]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_gt_freq@freq_range_exec:
    - {shard-lnl}:        [FAIL][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-1/igt@xe_gt_freq@freq_range_exec.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-4/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][99] ([Intel XE#1358]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-9/igt@xe_pm@s4-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - {shard-lnl}:        [ABORT][101] ([Intel XE#1794]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][103] ([Intel XE#1794]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][105] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][106] ([Intel XE#1033] / [Intel XE#1214])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][107] ([Intel XE#1242]) -> [FAIL][108] ([Intel XE#1231])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][110] ([Intel XE#1214] / [Intel XE#1551])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - shard-dg2-set2:     [FAIL][111] ([Intel XE#1081]) -> [DMESG-FAIL][112] ([Intel XE#358])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee -> xe-pw-135915v1

  IGT_7920: 7920
  xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee: 5ab7f53884ba8f486fafc94521b83096d9f9dfee
  xe-pw-135915v1: 135915v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/index.html

--===============5740192679213592509==
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
<tr><td><b>Series:</b></td><td>Update page fault queue size calculation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135915/">https://patchwork.freedesktop.org/series/135915/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee_full -&gt; xe-pw-135915v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135915v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-4/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-2/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-6/igt@xe_exec_threads@threads-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-4/igt@xe_exec_threads@threads-fd-userptr.html">DMESG-WARN</a> +128 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135915v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@xe_gt_freq@freq_range_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203">Intel XE#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-6/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-2/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_plane@pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format@pipe-b-plane-0}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@kms_plane@pixel-format@pipe-b-plane-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-a-plane-3}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-plane-3}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058">Intel XE#2058</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-1/igt@xe_gt_freq@freq_range_exec.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-4/igt@xe_gt_freq@freq_range_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee -&gt; xe-pw-135915v1</li>
</ul>
<p>IGT_7920: 7920<br />
  xe-1582-5ab7f53884ba8f486fafc94521b83096d9f9dfee: 5ab7f53884ba8f486fafc94521b83096d9f9dfee<br />
  xe-pw-135915v1: 135915v1</p>

</body>
</html>

--===============5740192679213592509==--
