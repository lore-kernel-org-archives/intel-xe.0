Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70796D0EE19
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 16:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB510EB20;
	Fri, 11 Oct 2024 16:01:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728A110EB20;
 Fri, 11 Oct 2024 16:01:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3463055839882863775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?drm/xe/ufence=3A_Prefetch_ufence_addr_to_catch_bogus_address?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 16:01:14 -0000
Message-ID: <172866247445.1241201.8833403924241063780@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011115715.3486872-1-nirmoy.das@intel.com>
In-Reply-To: <20241011115715.3486872-1-nirmoy.das@intel.com>
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

--===============3463055839882863775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/ufence: Prefetch ufence addr to catch bogus address
URL   : https://patchwork.freedesktop.org/series/139887/
State : failure

== Summary ==

CI Bug Log - changes from xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16_full -> xe-pw-139887v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139887v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139887v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139887v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-a:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right@pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right@pipe-a.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-4/igt@kms_plane_multiple@tiling-y.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_plane_multiple@tiling-y.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html

  * igt@xe_module_load@many-reload:
    - shard-lnl:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_module_load@many-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in xe-pw-139887v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#660])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#324]) +2 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_async_flips@test-time-stamp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1195]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#1659]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1467])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +34 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2669]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1468])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#309]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#599])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1137])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#301]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1421]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#310])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#886]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#301]) +6 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953]) +1 other test dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#2049])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397] / [Intel XE#1745])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1397])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1874])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#658])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +12 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#651]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#651]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#653]) +22 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#656]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#346])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
    - shard-lnl:          [PASS][80] -> [DMESG-FAIL][81] ([Intel XE#324]) +1 other test dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:
    - shard-lnl:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#324]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][84] ([Intel XE#324]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@viewport:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#1471]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@kms_plane_cursor@viewport.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2763]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#870])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1129])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1620] / [Intel XE#2864])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          [PASS][92] -> [DMESG-FAIL][93] ([Intel XE#1620] / [Intel XE#2990])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1489]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2939])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#899]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#455]) +10 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2168])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#756])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#756])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1447])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1123])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1123])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2905]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2905]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2905])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#688]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1392]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1392]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288]) +12 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#288]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][116] ([Intel XE#1999]) +2 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2541]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#2541])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1061])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#1173]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [PASS][121] -> [TIMEOUT][122] ([Intel XE#1358] / [Intel XE#1620] / [Intel XE#2574])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][123] -> [ABORT][124] ([Intel XE#1794])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][125] -> [ABORT][126] ([Intel XE#1358] / [Intel XE#1607])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@xe_pm@s4-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][127] -> [ABORT][128] ([Intel XE#1607] / [Intel XE#1794])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#944]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#944]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@large-binds-67108864:
    - shard-adlp:         [PASS][132] -> [TIMEOUT][133] ([Intel XE#1033]) +1 other test timeout
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@xe_vm@large-binds-67108864.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@xe_vm@large-binds-67108864.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][134] ([Intel XE#827]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
    - {shard-bmg}:        [FAIL][136] ([Intel XE#827]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [FAIL][138] -> [PASS][139] +5 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][140] ([Intel XE#1659]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][142] ([Intel XE#2436]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#1195]) -> [PASS][147] +4 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][148] ([Intel XE#2929]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-1/igt@kms_color@ctm-red-to-blue@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][150] ([Intel XE#877]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][152] ([Intel XE#301]) -> [PASS][153] +5 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][154] ([Intel XE#2625]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][156] -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][158] ([Intel XE#886]) -> [PASS][159] +5 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-bmg}:        [INCOMPLETE][160] ([Intel XE#2597]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][164] ([Intel XE#1874]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][166] ([Intel XE#324]) -> [PASS][167] +4 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][168] ([Intel XE#1430]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][170] ([Intel XE#2948]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][172] ([Intel XE#2883]) -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][174] ([Intel XE#2105]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-shared-vm-basic:
    - shard-lnl:          [INCOMPLETE][176] ([Intel XE#1169]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-basic.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@xe_exec_threads@threads-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {shard-bmg}:        [INCOMPLETE][178] ([Intel XE#2998]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][180] ([Intel XE#1358]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][182] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@xe_pm@s4-basic.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-5/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][184] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [ABORT][186] -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][188] ([Intel XE#1231]) -> [DMESG-FAIL][189] ([Intel XE#324])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][190] ([Intel XE#324]) -> [FAIL][191] ([Intel XE#1231])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][192] ([Intel XE#324]) -> [DMESG-WARN][193] ([Intel XE#324])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][194] ([Intel XE#455] / [Intel XE#787]) -> [TIMEOUT][195] ([Intel XE#1033]) +1 other test timeout
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][196] ([Intel XE#1861]) -> [TIMEOUT][197] ([Intel XE#1033])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         [SKIP][198] ([Intel XE#2927]) -> [TIMEOUT][199] ([Intel XE#1033])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][200] ([Intel XE#1035]) -> [INCOMPLETE][201] ([Intel XE#1035] / [Intel XE#1195])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][202] ([Intel XE#324]) -> [DMESG-FAIL][203] ([Intel XE#324])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][204] ([Intel XE#1473]) -> [FAIL][205] ([Intel XE#1000])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16 -> xe-pw-139887v1

  IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16: 09a8c322287e106dca33e28fa7f1475255a9ef16
  xe-pw-139887v1: 139887v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/index.html

--===============3463055839882863775==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/ufence: Prefetch ufence addr to catch bogus address</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139887/">https://patchwork.freedesktop.org/series/139887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16_full -&gt; xe-pw-139887v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139887v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139887v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139887v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right@pipe-a.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-4/igt@kms_plane_multiple@tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_plane_multiple@tiling-y.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@xe_module_load@many-reload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@d3cold-multiple-execs:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139887v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_async_flips@test-time-stamp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990">Intel XE#2990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574">Intel XE#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-67108864:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@xe_vm@large-binds-67108864.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@xe_vm@large-binds-67108864.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-1/igt@kms_color@ctm-red-to-blue@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_color@ctm-red-to-blue@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-7/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-1/igt@xe_exec_threads@threads-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-436/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-5/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139887v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16 -&gt; xe-pw-139887v1</li>
</ul>
<p>IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2048-09a8c322287e106dca33e28fa7f1475255a9ef16: 09a8c322287e106dca33e28fa7f1475255a9ef16<br />
  xe-pw-139887v1: 139887v1</p>

</body>
</html>

--===============3463055839882863775==--
