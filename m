Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA689CFB45C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 09:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69F10E032;
	Tue,  8 Oct 2024 09:20:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199F10E4B1;
 Tue,  8 Oct 2024 09:20:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2017642699289806274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vf=3A_Post-migration_rec?=
 =?utf-8?q?overy_worker_basis_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 09:20:41 -0000
Message-ID: <172837924152.1202832.18197135408135169579@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
In-Reply-To: <20241007201631.3369513-1-tomasz.lis@intel.com>
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

--===============2017642699289806274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery worker basis (rev4)
URL   : https://patchwork.freedesktop.org/series/138935/
State : failure

== Summary ==

CI Bug Log - changes from xe-2019-d6a4624817a46144a4dbc125c9371439edc82295_full -> xe-pw-138935v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138935v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138935v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138935v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
    - {shard-bmg}:        [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html

  
Known issues
------------

  Here are the changes found in xe-pw-138935v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#324]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1701]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1659])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#877])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#373]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#309])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#1475])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1421])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][37] ([Intel XE#886]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#886]) +3 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#301]) +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401] / [Intel XE#1745])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#352])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#656]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [PASS][48] -> [INCOMPLETE][49] ([Intel XE#2050])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#651]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#651]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#653]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#653]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_hdr@static-swap:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#455]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2934])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2332])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
    - shard-lnl:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#324])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#324]) +2 other tests dmesg-fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2763]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#1430])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#836])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1620] / [Intel XE#2864])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
    - shard-lnl:          [PASS][68] -> [DMESG-FAIL][69] ([Intel XE#1620])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1489])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2850] / [Intel XE#929])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1406])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1127])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#2055])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#2443]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#455] / [Intel XE#488])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_eudebug@vma-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2905]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#688])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#261] / [Intel XE#688])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1392])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1392])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#288]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][86] ([Intel XE#1962])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2229]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#979])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-basic:
    - shard-lnl:          [PASS][89] -> [DMESG-WARN][90] ([Intel XE#1620])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@xe_pm@d3hot-basic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [ABORT][91] ([Intel XE#1358] / [Intel XE#1607])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#944]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][93] ([Intel XE#2919])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#324]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][96] ([Intel XE#1659]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256:
    - shard-adlp:         [DMESG-WARN][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-lnl:          [FAIL][100] -> [PASS][101] +2 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][102] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][104] ([Intel XE#1475]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][106] ([Intel XE#2958]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [INCOMPLETE][108] -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][110] ([Intel XE#301]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301]) -> [PASS][115] +4 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - {shard-bmg}:        [FAIL][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [FAIL][118] ([Intel XE#886]) -> [PASS][119] +7 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [FAIL][120] ([Intel XE#2957]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][122] ([Intel XE#324]) -> [PASS][123] +2 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][124] ([Intel XE#324]) -> [PASS][125] +6 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [INCOMPLETE][126] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-FAIL][128] ([Intel XE#1620]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][130] ([Intel XE#899]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
    - shard-lnl:          [INCOMPLETE][132] ([Intel XE#2760]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html

  * igt@xe_create@create-contexts:
    - shard-lnl:          [DMESG-WARN][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_create@create-contexts.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_create@create-contexts.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][136] ([Intel XE#1000]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-adlp:         [DMESG-WARN][138] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_balancer@no-exec-parallel-rebind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-lnl:          [FAIL][140] ([Intel XE#2754]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][142] ([Intel XE#958]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [TIMEOUT][144] -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#324]) -> [FAIL][147] ([Intel XE#1231])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][148] ([Intel XE#1231]) -> [DMESG-WARN][149] ([Intel XE#324])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [TIMEOUT][150] ([Intel XE#402]) -> [FAIL][151] ([Intel XE#1231])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][152] -> [SKIP][153] ([Intel XE#1392])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [INCOMPLETE][154] ([Intel XE#1195]) -> [TIMEOUT][155] ([Intel XE#2961]) +1 other test timeout
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2019-d6a4624817a46144a4dbc125c9371439edc82295 -> xe-pw-138935v4

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2019-d6a4624817a46144a4dbc125c9371439edc82295: d6a4624817a46144a4dbc125c9371439edc82295
  xe-pw-138935v4: 138935v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html

--===============2017642699289806274==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery worker basis (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138935/">https://patchwork.freedesktop.org/series/138935/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2019-d6a4624817a46144a4dbc125c9371439edc82295_full -&gt; xe-pw-138935v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138935v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138935v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138935v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138935v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332">Intel XE#2332</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-7/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-2/igt@xe_pm@d3hot-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957">Intel XE#2957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2760">Intel XE#2760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-5/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-contexts:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-1/igt@xe_create@create-contexts.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_create@create-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_balancer@no-exec-parallel-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2019-d6a4624817a46144a4dbc125c9371439edc82295/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138935v4/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2019-d6a4624817a46144a4dbc125c9371439edc82295 -&gt; xe-pw-138935v4</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2019-d6a4624817a46144a4dbc125c9371439edc82295: d6a4624817a46144a4dbc125c9371439edc82295<br />
  xe-pw-138935v4: 138935v4</p>

</body>
</html>

--===============2017642699289806274==--
