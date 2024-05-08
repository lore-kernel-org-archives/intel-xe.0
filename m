Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE7DC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 10:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26727113558;
	Wed,  8 May 2024 10:07:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CE9113558;
 Wed,  8 May 2024 10:06:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7696937320872330411=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?drm/xe/display=3A_Unify_DPT_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 10:06:59 -0000
Message-ID: <171516281935.2017561.16502470395911624063@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507173540.402185-1-juhapekka.heikkila@gmail.com>
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

--===============7696937320872330411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/display: Unify DPT mapping
URL   : https://patchwork.freedesktop.org/series/133290/
State : failure

== Summary ==

CI Bug Log - changes from xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4_full -> xe-pw-133290v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133290v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133290v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133290v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@xe_exec_balancer@once-parallel-basic:
    - shard-adlp:         NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@xe_exec_balancer@once-parallel-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - {shard-lnl}:        [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * {igt@xe_pm@s4-mocs}:
    - {shard-lnl}:        [FAIL][6] -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-3/igt@xe_pm@s4-mocs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-5/igt@xe_pm@s4-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-133290v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [PASS][8] -> [FAIL][9] ([Intel XE#616]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#1033]) +18 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1033] / [Intel XE#1214])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#309])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1195]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#656])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#653])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][28] -> [FAIL][29] ([Intel XE#1600])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_threads@threads-bal-mixed-basic:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [PASS][32] -> [SKIP][33] ([Intel XE#1192] / [Intel XE#1201])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1044] / [Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@xe_module_load@many-reload.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#1214])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@large-userptr-binds-134217728:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#1201]) +18 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@xe_vm@large-userptr-binds-134217728.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@xe_vm@large-userptr-binds-134217728.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][44] ([Intel XE#301]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - {shard-lnl}:        [FAIL][46] ([Intel XE#480] / [Intel XE#886]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         [DMESG-WARN][48] ([Intel XE#1214] / [Intel XE#1608]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][50] ([Intel XE#361]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [INCOMPLETE][52] ([Intel XE#1195]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [SKIP][54] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][56] ([Intel XE#771] / [Intel XE#899]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][58] ([Intel XE#899]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_universal_plane@universal-plane-sanity:
    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1214]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_universal_plane@universal-plane-sanity.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][62] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_atomic@atomic-plane-damage:
    - shard-adlp:         [ABORT][66] -> [INCOMPLETE][67] ([Intel XE#1195] / [Intel XE#1330])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-6/igt@kms_atomic@atomic-plane-damage.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-6/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][68] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][69] ([Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][70] ([Intel XE#1231]) -> [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#324])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [FAIL][72] ([Intel XE#650]) -> [SKIP][73] ([Intel XE#1201])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][75] ([Intel XE#1201] / [i915#2575])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][76] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][77] ([Intel XE#1195] / [Intel XE#927])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][78] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][79] ([Intel XE#1195])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][81] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][82] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][83] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][85] ([Intel XE#1201]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201]) -> [SKIP][87] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [ABORT][88] -> [SKIP][89] ([Intel XE#1201] / [Intel XE#656])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][91] ([Intel XE#1201]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][92] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][93] ([Intel XE#1191] / [Intel XE#1214])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][94] ([Intel XE#1162]) -> [FAIL][95] ([Intel XE#616]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_psr@psr-suspend:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][97] ([Intel XE#1201]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_psr@psr-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][99] ([Intel XE#1201] / [i915#2575])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][101] ([Intel XE#1201] / [i915#2575])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [DMESG-WARN][102] ([Intel XE#1214] / [Intel XE#1638]) -> [DMESG-WARN][103] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1638])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1731
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1777
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4 -> xe-pw-133290v1

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4: f58676e47c12a99409b71f7d3bab9f89e14522b4
  xe-pw-133290v1: 133290v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/index.html

--===============7696937320872330411==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/display: Unify DPT mapping</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133290/">https://patchwork.freedesktop.org/series/133290/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4_full -&gt; xe-pw-133290v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133290v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133290v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133290v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@xe_exec_balancer@once-parallel-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-right-edge.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-mocs}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-3/igt@xe_pm@s4-mocs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-5/igt@xe_pm@s4-mocs.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133290v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +18 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@xe_vm@large-userptr-binds-134217728.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@xe_vm@large-userptr-binds-134217728.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +18 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-463/igt@kms_universal_plane@universal-plane-sanity.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_universal_plane@universal-plane-sanity.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-6/igt@kms_atomic@atomic-plane-damage.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-6/igt@kms_atomic@atomic-plane-damage.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133290v1/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4 -&gt; xe-pw-133290v1</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1251-f58676e47c12a99409b71f7d3bab9f89e14522b4: f58676e47c12a99409b71f7d3bab9f89e14522b4<br />
  xe-pw-133290v1: 133290v1</p>

</body>
</html>

--===============7696937320872330411==--
