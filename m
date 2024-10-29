Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0CD3A66B
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 15:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5871E10E689;
	Tue, 29 Oct 2024 15:30:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A738710E688;
 Tue, 29 Oct 2024 15:30:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2143655994188420605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/psr=3A_minor_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 15:30:32 -0000
Message-ID: <173021583266.1359138.10945374013162692409@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730201504.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730201504.git.jani.nikula@intel.com>
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

--===============2143655994188420605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: minor cleanups
URL   : https://patchwork.freedesktop.org/series/140652/
State : failure

== Summary ==

CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -> xe-pw-140652v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140652v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140652v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140652v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_legacy@torture-move@pipe-d:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-d.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-d.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [FAIL][9] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] +2 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][12] +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][15] -> [FAIL][16] +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] +2 other tests incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_pm@s3-mocs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][23] ([Intel XE#2327]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][25] ([Intel XE#1124]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][27] ([Intel XE#2887]) -> [SKIP][28] +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][29] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][30] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][31] ([Intel XE#2231]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          [SKIP][33] ([Intel XE#2311]) -> [SKIP][34] +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][35] ([Intel XE#2333]) -> [SKIP][36] +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          [SKIP][37] ([Intel XE#2313]) -> [SKIP][38] +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][39] ([Intel XE#734]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][41] ([Intel XE#1489]) -> [SKIP][42] +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          [SKIP][43] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][44] +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@fbc-psr-cursor-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][45] ([Intel XE#2948]) -> [FAIL][46] +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html

  
New tests
---------

  New tests have been introduced between xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full and xe-pw-140652v1_full:

### New IGT tests (1) ###

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  

Known issues
------------

  Here are the changes found in xe-pw-140652v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#1885]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@core_hotunplug@hotrebind.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@core_hotunplug@hotrebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#3194])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#1701]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1124]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][54] ([Intel XE#3162])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2890]) +10 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1231] / [Intel XE#1242])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1124]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#619])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1124]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#367])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#367])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#367])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#787]) +41 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#787]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2890]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2907])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2887]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#1195])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#314]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#306])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#373]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2252])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#373])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#373]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-lnl:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#2929]) +1 other test dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_color@ctm-red-to-blue.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#1178])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#1178]) +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1424]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#2577]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#309]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#309]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1475])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#3007]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_legacy@forked-move.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cursor_legacy@forked-move.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][94] ([Intel XE#2141]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2244])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#455]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2244])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#776])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1138])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1137])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1135])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#310]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1421])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2423] / [i915#2575]) +27 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@dpms-vs-vblank-race.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#886]) +7 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][108] -> [INCOMPLETE][109] ([Intel XE#1195] / [Intel XE#2049])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][110] ([Intel XE#886]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1401] / [Intel XE#1745])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1401])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2380])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1397] / [Intel XE#1745])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1397])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2293]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#455]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#651]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#656]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#651]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][123] -> [FAIL][124] ([Intel XE#1861])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#2890]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [PASS][127] -> [ABORT][128] ([Intel XE#2625])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#651]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#656]) +7 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#653]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#653]) +19 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2313])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1339])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1470] / [Intel XE#2853])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#455])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2423])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#346])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2927])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#2423]) +70 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#599]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][145] -> [FAIL][146] ([Intel XE#1874]) +5 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][147] -> [FAIL][148] ([Intel XE#361])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2763]) +15 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#2763]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#2763]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#870]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#870])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][155] -> [FAIL][156] ([Intel XE#718])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][157] -> [FAIL][158] ([Intel XE#1430])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][159] -> [SKIP][160] ([Intel XE#2446]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][161] -> [SKIP][162] ([Intel XE#2446]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-lnl:          [PASS][163] -> [DMESG-WARN][164] ([Intel XE#3184])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_pm_rpm@i2c.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1489]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2893])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#1489])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2890]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#2948]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2234] / [Intel XE#2850])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#2939])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#327])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1437])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][177] -> [FAIL][178] ([Intel XE#2883]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#330])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][180] -> [FAIL][181] ([Intel XE#899])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][182] -> [FAIL][183] ([Intel XE#2443]) +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#1499])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#756])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#756])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][187] ([Intel XE#1050])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#1280] / [Intel XE#455])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1123])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#1126])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#2905]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2905])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2905]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][194] -> [TIMEOUT][195] ([Intel XE#1473] / [Intel XE#402])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#261] / [Intel XE#688])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][197] -> [TIMEOUT][198] ([Intel XE#1473]) +2 other tests timeout
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#688]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1130]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1392]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#1392])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#288]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][204] -> [FAIL][205] ([Intel XE#3160])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#288]) +9 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#2360])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#2905]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#1416])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_mmap@vram.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#379])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#2541])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#2541]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#977])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][214] ([Intel XE#1173])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#2284])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][216] -> [ABORT][217] ([Intel XE#1694])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][218] -> [ABORT][219] ([Intel XE#1794])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#1130]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][221] -> [FAIL][222] ([Intel XE#958])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#944]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#944])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#944])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          [PASS][226] -> [SKIP][227] ([Intel XE#1130]) +176 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_query@query-gt-list.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_query@query-gt-list.html

  * igt@xe_tlb@basic-tlb:
    - shard-adlp:         [PASS][228] -> [CRASH][229] ([Intel XE#3212])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_tlb@basic-tlb.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_tlb@basic-tlb.html
    - shard-bmg:          [PASS][230] -> [CRASH][231] ([Intel XE#3212])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_tlb@basic-tlb.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [PASS][232] -> [CRASH][233] ([Intel XE#3212])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_tlb@basic-tlb.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][234] -> [SKIP][235] ([Intel XE#1130]) +49 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][236] ([Intel XE#1885]) -> [PASS][237] +2 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][238] ([Intel XE#2134]) -> [PASS][239] +2 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@eof.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@fbdev@eof.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][240] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][243] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#3194]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [INCOMPLETE][246] ([Intel XE#3225]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][248] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][249] +4 other tests pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][250] ([Intel XE#2890]) -> [PASS][251] +15 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][252] ([Intel XE#877]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][254] ([Intel XE#2231]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2890]) -> [PASS][257] +5 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][258] -> [PASS][259] +2 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][260] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][262] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][264] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_fb_coherency@memset-crc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][268] ([Intel XE#301]) -> [PASS][269] +5 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][270] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][272] ([Intel XE#1195]) -> [PASS][273] +1 other test pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][274] ([Intel XE#2882]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:
    - shard-dg2-set2:     [FAIL][276] ([Intel XE#301]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][278] ([Intel XE#886]) -> [PASS][279] +8 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][280] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][281] +1 other test pass
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][282] ([Intel XE#1874]) -> [PASS][283] +1 other test pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][284] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][285] +1 other test pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_lease@lease-invalid-connector:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2423] / [i915#2575]) -> [PASS][287] +15 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_lease@lease-invalid-connector.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_lease@lease-invalid-connector.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][288] ([Intel XE#616]) -> [PASS][289] +1 other test pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][290] ([Intel XE#361]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][292] ([Intel XE#2446]) -> [PASS][293] +2 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][294] ([Intel XE#2423]) -> [PASS][295] +94 other tests pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][296] ([Intel XE#2948]) -> [PASS][297] +3 other tests pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][298] ([Intel XE#3007]) -> [PASS][299] +12 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_sequence@get-busy.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_sequence@get-busy.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][300] ([Intel XE#899]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2423]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@testdisplay.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@testdisplay.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][304] ([Intel XE#1130]) -> [PASS][305] +216 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1130]) -> [PASS][307] +14 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][308] -> [PASS][309] +1 other test pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [FAIL][310] -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][312] -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-adlp:         [FAIL][314] ([Intel XE#1081]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_exec_reset@parallel-close-fd.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd.html
    - shard-dg2-set2:     [FAIL][316] ([Intel XE#1081]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][318] ([Intel XE#2687]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [SKIP][320] ([Intel XE#1192]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][322] ([Intel XE#2136]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          [FAIL][324] ([Intel XE#2976]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][326] ([Intel XE#3184]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [ABORT][328] ([Intel XE#1358]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][330] ([Intel XE#1794]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][332] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][334] ([Intel XE#2423]) -> [SKIP][335] ([Intel XE#3007]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#873]) -> [SKIP][337] ([Intel XE#2423] / [i915#2575])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][338] ([Intel XE#2385]) -> [SKIP][339] ([Intel XE#2423])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][340] ([Intel XE#2231]) -> [SKIP][341] ([Intel XE#2327])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][342] ([Intel XE#2327]) -> [SKIP][343] ([Intel XE#2890]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][344] -> [SKIP][345] ([Intel XE#2231]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#316]) -> [SKIP][347] ([Intel XE#2351] / [Intel XE#2890])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][348] ([Intel XE#2890]) -> [SKIP][349] ([Intel XE#2327])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#316]) -> [SKIP][351] ([Intel XE#2890])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][352] ([Intel XE#1124]) -> [SKIP][353] ([Intel XE#2890]) +9 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][354] -> [SKIP][355] ([Intel XE#1124]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][356] ([Intel XE#1124]) -> [SKIP][357] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1124]) -> [SKIP][359] ([Intel XE#2351] / [Intel XE#2890])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][360] ([Intel XE#2890]) -> [SKIP][361] ([Intel XE#610]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][362] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][363] ([Intel XE#1124])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][364] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][365] ([Intel XE#3194])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#1124]) -> [SKIP][367] ([Intel XE#2890]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][368] ([Intel XE#2890]) -> [SKIP][369] ([Intel XE#1124]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][370] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][371] ([Intel XE#2423]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][372] ([Intel XE#2423]) -> [SKIP][373] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#367]) -> [SKIP][375] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][376] ([Intel XE#367]) -> [SKIP][377] ([Intel XE#2423]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][378] ([Intel XE#2231]) -> [SKIP][379] ([Intel XE#2887])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][380] -> [SKIP][381] ([Intel XE#2887])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][382] ([Intel XE#2887]) -> [SKIP][383] ([Intel XE#2890]) +8 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-bmg:          [SKIP][384] ([Intel XE#2887]) -> [SKIP][385] ([Intel XE#2231])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][386] ([Intel XE#2890]) -> [SKIP][387] ([Intel XE#2887]) +14 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2907]) -> [SKIP][389] ([Intel XE#2890])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][390] ([Intel XE#2887]) -> [SKIP][391] ([Intel XE#2231] / [Intel XE#2890])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][392] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][393] ([Intel XE#2887])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2890]) -> [SKIP][395] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][397] ([Intel XE#2890]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][398] ([Intel XE#2890]) -> [SKIP][399] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][400] ([Intel XE#2890]) -> [SKIP][401] ([Intel XE#2724])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][402] ([Intel XE#2724]) -> [SKIP][403] ([Intel XE#2890])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][404] ([Intel XE#2325]) -> [SKIP][405] ([Intel XE#2423])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][406] ([Intel XE#2423]) -> [SKIP][407] ([Intel XE#2325])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2423] / [i915#2575]) -> [SKIP][409] ([Intel XE#306])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_color@gamma.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          [SKIP][410] ([Intel XE#3007]) -> [SKIP][411] ([Intel XE#2325])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_color@gamma.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][412] ([Intel XE#2252]) -> [SKIP][413] ([Intel XE#2423]) +8 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][414] ([Intel XE#2423]) -> [SKIP][415] ([Intel XE#2252]) +12 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#2423] / [i915#2575]) -> [SKIP][417] ([Intel XE#373])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#373]) -> [SKIP][419] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][420] ([Intel XE#2423]) -> [SKIP][421] ([Intel XE#2390]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#307]) -> [SKIP][423] ([Intel XE#2423] / [i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][424] ([Intel XE#3007]) -> [FAIL][425] ([Intel XE#1178])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_content_protection@srm.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2423] / [i915#2575]) -> [FAIL][427] ([Intel XE#1178])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_content_protection@srm.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][428] ([Intel XE#2423]) -> [SKIP][429] ([Intel XE#2341])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@type1.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][430] ([Intel XE#2320]) -> [SKIP][431] ([Intel XE#2423]) +5 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][432] ([Intel XE#2423]) -> [SKIP][433] ([Intel XE#2320]) +3 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][434] ([Intel XE#2320]) -> [SKIP][435] ([Intel XE#3007]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][436] ([Intel XE#2423]) -> [SKIP][437] ([Intel XE#2321])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#308]) -> [SKIP][439] ([Intel XE#2423] / [i915#2575])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][440] ([Intel XE#3007]) -> [SKIP][441] ([Intel XE#2320])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2423] / [i915#2575]) -> [SKIP][443] ([Intel XE#308])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          [SKIP][444] ([Intel XE#3007]) -> [SKIP][445] ([Intel XE#2321])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][446] ([Intel XE#2423]) -> [SKIP][447] ([Intel XE#2286])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][448] ([Intel XE#2286]) -> [SKIP][449] ([Intel XE#2423])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][450] ([Intel XE#2890]) -> [FAIL][451] ([Intel XE#2141])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][452] ([Intel XE#1508]) -> [SKIP][453] ([Intel XE#2890]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][454] ([Intel XE#2423]) -> [SKIP][455] ([Intel XE#2323])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][456] ([Intel XE#2244]) -> [SKIP][457] ([Intel XE#2231] / [Intel XE#2890])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][458] ([Intel XE#2890]) -> [SKIP][459] ([Intel XE#2244])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][460] ([Intel XE#776]) -> [SKIP][461] ([Intel XE#2890])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][462] ([Intel XE#2373]) -> [SKIP][463] ([Intel XE#2423])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][464] ([Intel XE#2375]) -> [SKIP][465] ([Intel XE#2423])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][466] ([Intel XE#2374]) -> [SKIP][467] ([Intel XE#3007])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1135]) -> [SKIP][469] ([Intel XE#2423] / [i915#2575])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][470] ([Intel XE#301]) -> [SKIP][471] ([Intel XE#2423])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][472] ([Intel XE#2049] / [Intel XE#2597]) -> [INCOMPLETE][473] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][474] -> [SKIP][475] ([Intel XE#2380])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][476] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][477] ([Intel XE#2890]) +2 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][478] ([Intel XE#2890]) -> [SKIP][479] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#455]) -> [SKIP][481] ([Intel XE#2890]) +3 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][482] ([Intel XE#2311]) -> [SKIP][483] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][484] ([Intel XE#2890]) -> [SKIP][485] ([Intel XE#2311]) +30 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#651]) -> [SKIP][487] ([Intel XE#2890]) +7 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][488] ([Intel XE#2231]) -> [SKIP][489] ([Intel XE#2311])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][491] ([Intel XE#651])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#651]) -> [SKIP][493] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][494] ([Intel XE#2311]) -> [SKIP][495] ([Intel XE#2890]) +18 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][496] -> [SKIP][497] ([Intel XE#2311]) +2 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][498] ([Intel XE#2890]) -> [SKIP][499] ([Intel XE#2231] / [Intel XE#2890]) +6 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][500] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][501] ([Intel XE#2333])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][502] ([Intel XE#2333]) -> [SKIP][503] ([Intel XE#2231])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][504] ([Intel XE#2333]) -> [SKIP][505] ([Intel XE#2890]) +8 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][506] ([Intel XE#2890]) -> [FAIL][507] ([Intel XE#2333]) +16 other tests fail
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][508] -> [FAIL][509] ([Intel XE#2333]) +1 other test fail
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][510] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][511] ([Intel XE#2311])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][512] ([Intel XE#2311]) -> [SKIP][513] ([Intel XE#2231]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][514] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][515] ([Intel XE#656])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#2890]) -> [SKIP][517] ([Intel XE#651]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][518] ([Intel XE#2313]) -> [SKIP][519] ([Intel XE#2231] / [Intel XE#2890]) +3 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][520] ([Intel XE#2313]) -> [SKIP][521] ([Intel XE#2890]) +18 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][522] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][523] ([Intel XE#2313]) +4 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2890]) -> [SKIP][525] ([Intel XE#653]) +4 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][526] ([Intel XE#2890]) -> [SKIP][527] ([Intel XE#2313]) +25 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][528] ([Intel XE#2333]) -> [SKIP][529] ([Intel XE#2231] / [Intel XE#2890]) +3 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][530] ([Intel XE#2231]) -> [SKIP][531] ([Intel XE#2313])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#653]) -> [SKIP][533] ([Intel XE#2890]) +8 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][534] -> [SKIP][535] ([Intel XE#2313]) +2 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#653]) -> [SKIP][537] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#605]) -> [SKIP][539] ([Intel XE#2423] / [i915#2575])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][540] ([Intel XE#2890]) -> [SKIP][541] ([Intel XE#2927])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#356]) -> [SKIP][543] ([Intel XE#2423] / [i915#2575])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][544] ([Intel XE#2423]) -> [SKIP][545] ([Intel XE#2486])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][546] ([Intel XE#2393]) -> [SKIP][547] ([Intel XE#2423])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][548] ([Intel XE#2423]) -> [SKIP][549] ([Intel XE#2493])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][550] ([Intel XE#2423]) -> [SKIP][551] ([Intel XE#2763]) +3 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-bmg:          [SKIP][552] ([Intel XE#2763]) -> [SKIP][553] ([Intel XE#2423]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][554] ([Intel XE#2763]) -> [SKIP][555] ([Intel XE#3007])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][557] ([Intel XE#2423] / [i915#2575])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-bmg:          [SKIP][558] ([Intel XE#3007]) -> [SKIP][559] ([Intel XE#2423]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][560] ([Intel XE#2890]) -> [SKIP][561] ([Intel XE#2938])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][562] ([Intel XE#2890]) -> [FAIL][563] ([Intel XE#1430])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][564] ([Intel XE#2392]) -> [SKIP][565] ([Intel XE#2890])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][566] ([Intel XE#2505]) -> [SKIP][567] ([Intel XE#2890])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][568] ([Intel XE#2446]) -> [SKIP][569] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#1489]) -> [SKIP][571] ([Intel XE#2890]) +2 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][572] ([Intel XE#1489]) -> [SKIP][573] ([Intel XE#2890]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][574] -> [SKIP][575] ([Intel XE#1489]) +2 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][576] ([Intel XE#2231]) -> [SKIP][577] ([Intel XE#1489])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2890]) -> [SKIP][579] ([Intel XE#1489])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][580] ([Intel XE#2890]) -> [SKIP][581] ([Intel XE#1489]) +4 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][582] ([Intel XE#1489]) -> [SKIP][583] ([Intel XE#2231] / [Intel XE#2890])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][584] ([Intel XE#2890]) -> [SKIP][585] ([Intel XE#2387]) +1 other test skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          [SKIP][586] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][587] ([Intel XE#2231])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-render.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][589] ([Intel XE#2351] / [Intel XE#2890])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][591] ([Intel XE#2850] / [Intel XE#929])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-bmg:          [SKIP][592] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][593] ([Intel XE#2890]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@fbc-psr-no-drrs.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][594] -> [SKIP][595] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][597] ([Intel XE#2890]) +1 other test skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          [SKIP][598] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][599] ([Intel XE#2234] / [Intel XE#2850])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][600] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][601] ([Intel XE#2231] / [Intel XE#2890])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][603] ([Intel XE#2351]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-bmg:          [SKIP][604] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][605] ([Intel XE#2890]) +7 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr@psr2-cursor-blt.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][606] ([Intel XE#2890]) -> [SKIP][607] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][608] ([Intel XE#2414]) -> [SKIP][609] ([Intel XE#2890]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][610] ([Intel XE#2329]) -> [SKIP][611] ([Intel XE#2423]) +3 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][612] ([Intel XE#2423]) -> [SKIP][613] ([Intel XE#2330])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][614] ([Intel XE#2426]) -> [FAIL][615] ([Intel XE#1729])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][616] ([Intel XE#2423]) -> [SKIP][617] ([Intel XE#2426])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#455]) -> [SKIP][619] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][620] ([Intel XE#756]) -> [SKIP][621] ([Intel XE#2423])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [FAIL][622] ([Intel XE#1050]) -> [SKIP][623] ([Intel XE#1130])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#1130]) -> [SKIP][625] ([Intel XE#1280] / [Intel XE#455])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#1123]) -> [SKIP][627] ([Intel XE#1130])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][628] ([Intel XE#1130]) -> [SKIP][629] ([Intel XE#2504])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][630] ([Intel XE#1130]) -> [SKIP][631] ([Intel XE#2905]) +14 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-read-event.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#1130]) -> [SKIP][633] ([Intel XE#2905])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][634] ([Intel XE#2905]) -> [SKIP][635] ([Intel XE#1130]) +14 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_eudebug_online@single-step.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_eudebug_online@single-step.html
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#2905]) -> [SKIP][637] ([Intel XE#1130]) +2 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_eudebug_online@single-step.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [FAIL][638] ([Intel XE#2364]) -> [SKIP][639] ([Intel XE#1130])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][640] ([Intel XE#1130]) -> [TIMEOUT][641] ([Intel XE#1473])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [SKIP][642] ([Intel XE#1130]) -> [FAIL][643] ([Intel XE#2364])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][644] ([Intel XE#2322]) -> [SKIP][645] ([Intel XE#1130]) +10 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][646] ([Intel XE#1130]) -> [SKIP][647] ([Intel XE#2322]) +11 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][648] -> [SKIP][649] ([Intel XE#1130])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1130]) -> [SKIP][651] ([Intel XE#288]) +3 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][652] ([Intel XE#288]) -> [SKIP][653] ([Intel XE#1130]) +7 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][654] ([Intel XE#1130]) -> [SKIP][655] ([Intel XE#2360])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][656] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][657] ([Intel XE#1130])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_media_fill@media-fill.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][658] ([Intel XE#1130]) -> [SKIP][659] ([Intel XE#586])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_mmap@small-bar.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][660] ([Intel XE#1130]) -> [SKIP][661] ([Intel XE#2541])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#2541]) -> [SKIP][663] ([Intel XE#1130]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_oa@map-oa-buffer.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][664] ([Intel XE#1130]) -> [SKIP][665] ([Intel XE#2248])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][666] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][667] ([Intel XE#1130])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_pat@pat-index-xelp.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][668] ([Intel XE#2236]) -> [SKIP][669] ([Intel XE#1130])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][670] ([Intel XE#2557]) -> [SKIP][671] ([Intel XE#2427])
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_peer2peer@write.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@xe_peer2peer@write.html
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#1061]) -> [FAIL][673] ([Intel XE#1173])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_peer2peer@write.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][674] ([Intel XE#1130]) -> [SKIP][675] ([Intel XE#2284])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][676] ([Intel XE#2284]) -> [SKIP][677] ([Intel XE#1130])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][678] ([Intel XE#2284]) -> [SKIP][679] ([Intel XE#1130]) +2 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][680] ([Intel XE#1130]) -> [SKIP][681] ([Intel XE#579])
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][682] ([Intel XE#944]) -> [SKIP][683] ([Intel XE#1130]) +4 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][684] ([Intel XE#944]) -> [SKIP][685] ([Intel XE#1130])
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_query@multigpu-query-invalid-size.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][686] ([Intel XE#1130]) -> [SKIP][687] ([Intel XE#944]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [FAIL][688] ([Intel XE#2922]) -> [SKIP][689] ([Intel XE#1130])
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_tlb@basic-tlb.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][690] ([Intel XE#3075] / [Intel XE#3084]) -> [DMESG-WARN][691] ([Intel XE#3075] / [Intel XE#3084])
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8086 -> IGT_8087
  * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-pw-140652v1

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
  xe-pw-140652v1: 140652v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/index.html

--===============2143655994188420605==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: minor cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140652/">https://patchwork.freedesktop.org/series/140652/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -&gt; xe-pw-140652v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140652v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140652v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140652v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-linear.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-d.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@xe_exercise_blt@fast-copy-inc-dimension@tile4-vram01-vram01-436x436.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full and xe-pw-140652v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140652v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_color@ctm-red-to-blue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_color@ctm-red-to-blue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_legacy@forked-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cursor_legacy@forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip@dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_query@query-gt-list.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_query@query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +176 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +49 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@fbdev@eof.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-connector:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_lease@lease-invalid-connector.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_lease@lease-invalid-connector.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_properties@connector-properties-legacy.html">PASS</a> +94 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_sequence@get-busy.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +216 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_pm@s3-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557">Intel XE#2557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140652v1/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGT_8087</li>
<li>Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -&gt; xe-pw-140652v1</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab<br />
  xe-pw-140652v1: 140652v1</p>

</body>
</html>

--===============2143655994188420605==--
