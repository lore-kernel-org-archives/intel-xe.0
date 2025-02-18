Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D3C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 07:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26D10E1B9;
	Tue, 18 Feb 2025 07:45:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB29410E1B9;
 Tue, 18 Feb 2025 07:45:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6900783073185010947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_Provide_more_i?=
 =?utf-8?q?nformation_on_display_faults_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 07:45:22 -0000
Message-ID: <173986472287.3490614.12861856218075463806@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217070047.953-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250217070047.953-1-ville.syrjala@linux.intel.com>
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

--===============6900783073185010947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Provide more information on display faults (rev3)
URL   : https://patchwork.freedesktop.org/series/143626/
State : failure

== Summary ==

CI Bug Log - changes from xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5_full -> xe-pw-143626v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143626v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143626v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143626v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +23 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +15 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] +8 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][10] ([Intel XE#1033]) -> [DMESG-WARN][11] +58 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][12] ([Intel XE#1033]) -> [DMESG-WARN][13] +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][14] ([Intel XE#1033]) -> [DMESG-FAIL][15] +16 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][16] ([Intel XE#4172] / [Intel XE#877]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][18] ([Intel XE#1033]) -> [DMESG-FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#310]) -> [DMESG-WARN][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][22] ([Intel XE#4172]) -> [DMESG-WARN][23] +52 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pipe_stress@stress-xrgb8888-ytiled}:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  
Known issues
------------

  Here are the changes found in xe-pw-143626v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4173])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#3908]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2327]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#619])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1124]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2191])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +16 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +44 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1727] / [Intel XE#2705])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1727])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#306]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#373]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2252]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2390])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#3304])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#308])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#309]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#309]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1508])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1340])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#310])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#310]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#3321]) +7 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][62] ([Intel XE#2955])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#886]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#3321]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301]) +3 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#455]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4141]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#656]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#658]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#656]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#4328])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2934])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2763]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#870])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-adlp:         [PASS][86] -> [DMESG-WARN][87] ([Intel XE#2953]) +2 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][89] ([Intel XE#2042])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1489]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1489]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2939])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1127])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2330])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#899])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#4330]) +3 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1499])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#756])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_writeback@writeback-check-output.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#4278]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2905]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2905]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][107] ([Intel XE#1473])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2322]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#288]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2541] / [Intel XE#3573])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_oa@stress-open-close.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#977])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2236])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [ABORT][113] ([Intel XE#4268])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][114] -> [DMESG-WARN][115] ([Intel XE#3088]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4130])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#3342])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [DMESG-WARN][118] ([Intel XE#1033]) -> [PASS][119] +10 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@fbdev@read.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@fbdev@read.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#2191]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][122] ([Intel XE#1727]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_color@legacy-gamma:
    - shard-bmg:          [DMESG-WARN][126] ([Intel XE#877]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_color@legacy-gamma.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@kms_color@legacy-gamma.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][128] ([Intel XE#4172]) -> [PASS][129] +19 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#309]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][132] ([Intel XE#2373]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#310]) -> [PASS][135] +7 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][136] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#301]) -> [PASS][139] +3 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][140] ([Intel XE#2316]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][142] ([Intel XE#1033]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][144] ([Intel XE#1874]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#656]) -> [PASS][147] +4 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#455]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][150] ([Intel XE#1503]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#4328]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_rpm@legacy-planes.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-adlp:         [DMESG-WARN][156] -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1169]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [SKIP][183], [PASS][184], [PASS][185]) ([Intel XE#378]) -> ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][211] ([Intel XE#4173]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][214] ([Intel XE#787]) +12 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#787]) -> [SKIP][216] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#455]) -> [FAIL][218] ([Intel XE#1178])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#4172]) -> [DMESG-WARN][220] ([Intel XE#4330]) +11 other tests dmesg-warn
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][221] ([Intel XE#1033]) -> [SKIP][222] ([Intel XE#310])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][223] ([Intel XE#2316]) -> [FAIL][224] ([Intel XE#3321])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#4172]) -> [SKIP][226] ([Intel XE#2316])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#2955]) -> [SKIP][228] ([Intel XE#310])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][229] ([Intel XE#1033]) -> [FAIL][230] ([Intel XE#301])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [DMESG-WARN][231] ([Intel XE#1033]) -> [FAIL][232] ([Intel XE#301] / [Intel XE#3321])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][233] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][234] ([Intel XE#324]) +5 other tests dmesg-fail
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][235] ([Intel XE#2312]) -> [SKIP][236] ([Intel XE#2311]) +8 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][237] ([Intel XE#2311]) -> [SKIP][238] ([Intel XE#2312]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#4141]) -> [SKIP][240] ([Intel XE#2312])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][241] ([Intel XE#2312]) -> [SKIP][242] ([Intel XE#4141]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#651]) -> [SKIP][244] ([Intel XE#656]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#656]) -> [SKIP][246] ([Intel XE#651]) +13 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][247] ([Intel XE#2313]) -> [SKIP][248] ([Intel XE#2312]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#653]) -> [SKIP][250] ([Intel XE#656]) +8 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#656]) -> [SKIP][252] ([Intel XE#653]) +13 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][253] ([Intel XE#2312]) -> [SKIP][254] ([Intel XE#2313]) +6 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][255] ([Intel XE#3544]) -> [SKIP][256] ([Intel XE#3374] / [Intel XE#3544])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1500]) -> [SKIP][258] ([Intel XE#362])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-bmg:          [DMESG-WARN][259] ([Intel XE#1473] / [Intel XE#4172]) -> [DMESG-WARN][260] ([Intel XE#1473])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_evict@evict-large-multi-vm.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#4172] / [Intel XE#569]) -> [DMESG-WARN][262] ([Intel XE#569]) +4 other tests dmesg-warn
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][263] ([Intel XE#1033] / [Intel XE#569]) -> [DMESG-WARN][264] ([Intel XE#569]) +4 other tests dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [ABORT][265] ([Intel XE#4172] / [Intel XE#4268]) -> [ABORT][266] ([Intel XE#4268])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_pm@s4-basic-exec.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][267] ([Intel XE#1033] / [Intel XE#4268]) -> [ABORT][268] ([Intel XE#4268]) +1 other test abort
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [DMESG-WARN][269] ([Intel XE#3088] / [Intel XE#4172]) -> [DMESG-WARN][270] ([Intel XE#3088]) +1 other test dmesg-warn
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -> xe-pw-143626v3

  IGT_8232: 8232
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5
  xe-pw-143626v3: 143626v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/index.html

--===============6900783073185010947==
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
<tr><td><b>Series:</b></td><td>drm/i915: Provide more information on displa=
y faults (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143626/">https://patchwork.freedesktop.org/series/143626/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143626v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143626v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2674-297dc497ff4e957b8a82d4d9f67631e32=
2bdd2a5_full -&gt; xe-pw-143626v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143626v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143626v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1436=
26v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> +23 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg=
-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">DM=
ESG-WARN</a> +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@c=
d-dp2-hdmi-a3.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp=
-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">DMES=
G-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_exe=
c_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_exec_ba=
sic@no-exec-basic-defer-bind.html">DMESG-WARN</a> +8 other tests dmesg-warn=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3626v3/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-d=
p-4.html">DMESG-WARN</a> +58 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3=
/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DM=
ESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
626v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">DMESG-FAIL</a> +16 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
26v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-=
WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fb=
con_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms=
_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_flip@=
2x-flip-vs-panning.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shar=
d-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</=
a> +52 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pipe_stress@stress-xrgb8888-ytiled}:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143626v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@core_ho=
tunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@core_hotunplug@hotu=
nbind-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_chamelium_frames@hdmi-f=
rame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-v=
s-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@k=
ms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip@2x-blocking-absolu=
te-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms=
_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_flip@2x-f=
lip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143626v3/shard-lnl-3/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tes=
ts skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_pm_=
dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/igt@kms_pm_dc@dc5-dpms-nega=
tive.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_pm_rpm@system-suspend-m=
odeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_psr@psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-lnl-8/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_vbla=
nk@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_vblank@ts-cont=
inuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +3 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_writeback@writeback-che=
ck-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_compu=
te_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
626v3/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe=
_engine_class_compute.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_eudebug@basic-client.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ex=
tended-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_evict@evict-large-multi-=
vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_oa@stress-open-close.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_pm_=
residency@gt-c6-freeze.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_pm_residency@gt-c=
6-freeze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-bmg-1/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@fbdev@=
read.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@fbdev@read.html">P=
ASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/s=
hard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_colo=
r@legacy-gamma.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@kms_color@le=
gacy-gamma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-46=
3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/=
igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> +7 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143626v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_flip@=
2x-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-8/=
igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
26v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_jo=
iner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@k=
ms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/igt@kms_pm=
_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_=
rpm@legacy-planes@plane-50.html">DMESG-WARN</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/igt@kms_pm_rpm@=
legacy-planes@plane-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
26v3/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322=
bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f676=
31e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d=
4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957=
b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497f=
f4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297=
dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
74-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bd=
d2a5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631=
e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a=
82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e=
957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc4=
97ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-=
297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3626v3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-434/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143626v3/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43626v3/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-adlp-9/i=
gt@xe_wedged@wedged-at-any-timeout.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143626v3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/=
shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-466/igt@kms=
_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-1=
/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a=
>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-46=
4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-=
bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/igt@kms_f=
lip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464/igt@k=
ms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-433/=
igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@d-dp4.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2=
-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143626v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp=
-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other=
 tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143626v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1436=
26v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43626v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3626v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143626v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626=
v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143626v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-5/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_evict=
@evict-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard=
-bmg-4/igt@xe_evict@evict-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_pm@s3=
-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-4/i=
gt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +4 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-d=
g2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +4 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-bmg-7/igt@xe_p=
m@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_pm@=
s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/shard-dg2-464=
/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) +1 other test a=
bort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@xe_pm_re=
sidency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143626v3/sh=
ard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#308=
8</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -&gt; xe-pw-143=
626v3</li>
</ul>
<p>IGT_8232: 8232<br />
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d=
9f67631e322bdd2a5<br />
  xe-pw-143626v3: 143626v3</p>

</body>
</html>

--===============6900783073185010947==--
