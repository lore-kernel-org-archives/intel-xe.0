Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2810CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 02:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4599010E4F1;
	Fri, 30 Aug 2024 02:06:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E2C10E4F1;
 Fri, 30 Aug 2024 02:06:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4385177831647051862=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_Fix_BMG_CCS?=
 =?utf-8?q?_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 02:06:42 -0000
Message-ID: <172498360230.849975.16171645156688939682@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829122928.423456-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240829122928.423456-1-juhapekka.heikkila@gmail.com>
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

--===============4385177831647051862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Fix BMG CCS modifiers
URL   : https://patchwork.freedesktop.org/series/137959/
State : failure

== Summary ==

CI Bug Log - changes from xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77_full -> xe-pw-137959v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137959v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137959v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137959v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-5/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][3] ([Intel XE#877]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - {shard-bmg}:        [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_sequence@get-idle:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][7] +2 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_sequence@get-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-137959v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1033])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1701]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#886]) +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#656])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#653])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#324]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1035] / [Intel XE#1195])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-435/igt@kms_plane@plane-position-covered.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-435/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#324])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#718])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#929])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][34] -> [FAIL][35] ([Intel XE#771] / [Intel XE#899])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#899]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#899])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195]) +2 other tests incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-434/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-436/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#2443]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@kms_vrr@max-min.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@kms_vrr@max-min.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#1392])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#2541])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][48] -> [ABORT][49] ([Intel XE#1358] / [Intel XE#1607])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-2/igt@xe_pm@s4-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][50] -> [ABORT][51] ([Intel XE#1358] / [Intel XE#1607])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][52] -> [ABORT][53] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][54] -> [ABORT][55] ([Intel XE#1794])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#958])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [FAIL][58] ([Intel XE#827]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
    - {shard-bmg}:        [DMESG-WARN][60] ([Intel XE#1033]) -> [PASS][61] +7 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][62] ([Intel XE#324]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [FAIL][66] ([Intel XE#1659]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
    - {shard-bmg}:        [SKIP][68] ([Intel XE#787]) -> [PASS][69] +44 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#877]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-bmg}:        [INCOMPLETE][72] ([Intel XE#2597]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][74] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][76] ([Intel XE#324]) -> [PASS][77] +2 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [DMESG-WARN][78] ([Intel XE#324]) -> [PASS][79] +6 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:
    - {shard-bmg}:        [INCOMPLETE][80] -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html

  * igt@kms_sequence@get-idle:
    - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1195]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_sequence@get-idle.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_sequence@get-idle.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][84] ([Intel XE#899]) -> [PASS][85] +2 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][86] ([Intel XE#899]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][88] ([Intel XE#1473]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
    - {shard-bmg}:        [DMESG-WARN][90] ([Intel XE#877]) -> [PASS][91] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][92] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][95] ([Intel XE#623])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#316]) -> [SKIP][97] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][98] ([Intel XE#324]) -> [FAIL][99] ([Intel XE#1204])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][100] ([Intel XE#1231]) -> [DMESG-FAIL][101] ([Intel XE#324])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][102] ([Intel XE#324]) -> [FAIL][103] ([Intel XE#1231])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][105] ([Intel XE#610])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][107] ([Intel XE#1124]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1124]) -> [SKIP][109] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#607]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#607])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][113] ([Intel XE#367]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][115] ([Intel XE#2191])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#2191]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#2191])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#367]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][121] ([Intel XE#1252])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#787]) +76 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][129] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#306]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][133] ([Intel XE#373]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#373]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][137] ([Intel XE#307])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][139] ([Intel XE#308])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#308]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#308])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#323]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#323])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][145] ([Intel XE#323])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#455]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][149] ([Intel XE#776])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][151] ([Intel XE#703])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1138]) -> [SKIP][153] ([Intel XE#1138] / [Intel XE#1201])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][155] ([Intel XE#1135])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_feature_discovery@psr2.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][157] ([Intel XE#651]) +21 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#651]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#653]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][163] ([Intel XE#653]) +21 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][165] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][167] ([Intel XE#498]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#498]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][173] ([Intel XE#2318]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][175] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1129]) -> [SKIP][177] ([Intel XE#1129] / [Intel XE#1201]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1489]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][181] ([Intel XE#1489]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][183] ([Intel XE#1122]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#929]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][187] ([Intel XE#929]) +10 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-onoff.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][189] ([Intel XE#1149])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][191] ([Intel XE#1127])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#327]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#327])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][195] ([Intel XE#1729])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#330]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#330])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][199] ([Intel XE#455]) +13 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_vrr@flipline.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2168]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#2168])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_vrr@lobf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1126]) -> [SKIP][203] ([Intel XE#1126] / [Intel XE#1201])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#1473]) -> [INCOMPLETE][205] ([Intel XE#1195] / [Intel XE#1473])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#288]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][209] ([Intel XE#288]) +17 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2360]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#2360])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][213] ([Intel XE#255])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][215] ([Intel XE#378])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2541]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_oa@disabled-read-error.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][219] ([Intel XE#2541]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#979]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#979])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][223] ([Intel XE#2284] / [Intel XE#366])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][227] ([Intel XE#944]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#944]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77 -> xe-pw-137959v1

  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77: c3a10838b94df7ede31b57de48c6386ae1116c77
  xe-pw-137959v1: 137959v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/index.html

--===============4385177831647051862==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Fix BMG CCS modifiers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137959/">https://patchwork.freedesktop.org/series/137959/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77_full -&gt; xe-pw-137959v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137959v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137959v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137959v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-5/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_sequence@get-idle.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137959v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-435/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-435/igt@kms_plane@plane-position-covered.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-434/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-436/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_sequence@get-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_sequence@get-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137959v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77 -&gt; xe-pw-137959v1</li>
</ul>
<p>IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1855-c3a10838b94df7ede31b57de48c6386ae1116c77: c3a10838b94df7ede31b57de48c6386ae1116c77<br />
  xe-pw-137959v1: 137959v1</p>

</body>
</html>

--===============4385177831647051862==--
