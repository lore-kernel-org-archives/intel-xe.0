Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF281D33990
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 15:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821810E1EF;
	Mon, 28 Oct 2024 15:44:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53810E1EF;
 Mon, 28 Oct 2024 15:44:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7823090839867854543=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/ufence=3A_Flush_xe_order?=
 =?utf-8?q?ed=5Fwq_in_case_of_ufence_timeout_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 15:44:01 -0000
Message-ID: <173013024168.1355416.5436478288309101123@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028114956.2184923-1-nirmoy.das@intel.com>
In-Reply-To: <20241028114956.2184923-1-nirmoy.das@intel.com>
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

--===============7823090839867854543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/140386/
State : failure

== Summary ==

CI Bug Log - changes from xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full -> xe-pw-140386v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140386v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140386v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140386v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][4] -> [SKIP][5] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-466/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          [PASS][10] -> [DMESG-WARN][11] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][12] -> [FAIL][13] +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][14] -> [FAIL][15] +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-bal-mixed-basic:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] +2 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][18] -> [DMESG-WARN][19] +2 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][20] ([Intel XE#2327]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][22] ([Intel XE#2231]) -> [SKIP][23] +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][24] ([Intel XE#1124]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][26] ([Intel XE#2887]) -> [SKIP][27] +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][28] ([Intel XE#2311]) -> [SKIP][29] +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [FAIL][30] ([Intel XE#2333]) -> [SKIP][31] +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][32] ([Intel XE#2313]) -> [SKIP][33] +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][34] ([Intel XE#2927]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][36] ([Intel XE#1430]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][38] ([Intel XE#1489]) -> [SKIP][39] +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][40] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][41] +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-adlp:         [SKIP][42] ([Intel XE#455]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_live_ktest@xe_eudebug.html

  
New tests
---------

  New tests have been introduced between xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full and xe-pw-140386v3_full:

### New IGT tests (1) ###

  * igt@kms_pm_rpm@universal-planes@plane-41:
    - Statuses : 4 pass(s)
    - Exec time: [2.71, 15.73] s

  

Known issues
------------

  Here are the changes found in xe-pw-140386v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1885])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@core_hotunplug@hotreplug.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2134]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@fbdev@nullptr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#3194]) +1 other test dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [PASS][50] -> [DMESG-WARN][51] ([Intel XE#877]) +3 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1426]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1124]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2890]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][57] -> [DMESG-WARN][58] ([Intel XE#877]) +1 other test dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#1195] / [Intel XE#3225])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1124])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1124])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#2191]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#367])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2887])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#787]) +13 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#787]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#1195] / [Intel XE#3113])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#373])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1424])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1475]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#307])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#2958])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#776])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1137])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#301]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#2882]) +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#301]) +11 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#2953]) +1 other test dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][90] -> [ABORT][91] ([Intel XE#2625]) +1 other test abort
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#886]) +3 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#455]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#1491])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][97] -> [FAIL][98] ([Intel XE#1874]) +2 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#656]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#651]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2890]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#651]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#651]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#653]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#653]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2934])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - shard-adlp:         NOTRUN -> [FAIL][108] ([Intel XE#1874]) +3 other tests fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#361])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#1430])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#2446]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#2042]) +1 other test dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1489]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1489])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1128])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#327]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#327])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#2423]) +80 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_sequence@get-idle.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_sequence@get-idle.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2423]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#899]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][131] -> [FAIL][132] ([Intel XE#2159]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1499])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#455] / [Intel XE#488])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][135] ([Intel XE#1050])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1123])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2905]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2905]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2905])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_evict@evict-large.html

  * igt@xe_exec_atomic@basic-inc-all:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1130]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1392]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1392])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#288]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#288]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2360])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-bmg:          [PASS][147] -> [DMESG-WARN][148] ([Intel XE#3230])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-4/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-adlp:         [PASS][149] -> [DMESG-WARN][150] ([Intel XE#358])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-adlp:         [PASS][151] -> [DMESG-WARN][152] ([Intel XE#3230])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2229])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#2976]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#2541]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][157] -> [ABORT][158] ([Intel XE#1358]) +1 other test abort
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][159] -> [ABORT][160] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#944])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#944])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][163] -> [SKIP][164] ([Intel XE#1130]) +182 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_spin_batch@spin-all.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][167] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][169] ([Intel XE#1701]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1195]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][173] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#3113]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][177] ([Intel XE#1475]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][179] ([Intel XE#3177]) -> [PASS][180] +120 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][181] -> [PASS][182] +3 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][183] ([Intel XE#301]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#301]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#2953]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][189] ([Intel XE#886]) -> [PASS][190] +4 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [FAIL][191] ([Intel XE#1491]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][193] ([Intel XE#1874]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#455]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#361]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-bmg:          [DMESG-WARN][199] ([Intel XE#2566] / [Intel XE#3177]) -> [PASS][200] +16 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [DMESG-WARN][201] ([Intel XE#3184]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-lnl:          [DMESG-WARN][203] -> [PASS][204] +2 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][205] ([Intel XE#2443]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][207] ([Intel XE#1473]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][209] -> [PASS][210] +5 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][211] -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [FAIL][213] -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][215] ([Intel XE#3230]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [DMESG-WARN][217] -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [DMESG-WARN][219] -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-dg2-set2:     [DMESG-WARN][221] ([Intel XE#3230]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#3230]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-3/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][225] ([Intel XE#1192]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][227] ([Intel XE#1794]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][229] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][231] ([Intel XE#1794]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][233] ([Intel XE#2327]) -> [SKIP][234] ([Intel XE#2890]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][235] -> [FAIL][236] ([Intel XE#1231] / [Intel XE#1242])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][237] ([Intel XE#607]) -> [SKIP][238] ([Intel XE#2890])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][239] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-WARN][240] ([Intel XE#3194])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][241] ([Intel XE#1124]) -> [SKIP][242] ([Intel XE#2890]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][243] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][244] ([Intel XE#2423]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][245] ([Intel XE#367]) -> [SKIP][246] ([Intel XE#2423]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][247] ([Intel XE#2887]) -> [SKIP][248] ([Intel XE#2890]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][249] ([Intel XE#2325]) -> [SKIP][250] ([Intel XE#2423]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][251] ([Intel XE#2252]) -> [SKIP][252] ([Intel XE#2423]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [DMESG-FAIL][253] ([Intel XE#3177]) -> [FAIL][254] ([Intel XE#1178]) +5 other tests fail
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@kms_content_protection@atomic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][255] ([Intel XE#2390]) -> [SKIP][256] ([Intel XE#2423])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [DMESG-FAIL][257] ([Intel XE#3177]) -> [SKIP][258] ([Intel XE#2423])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_content_protection@legacy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [DMESG-FAIL][259] ([Intel XE#3177]) -> [FAIL][260] ([Intel XE#1188]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@kms_content_protection@uevent.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][261] ([Intel XE#2321]) -> [SKIP][262] ([Intel XE#2423])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][263] ([Intel XE#2320]) -> [SKIP][264] ([Intel XE#2423]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][265] ([Intel XE#2286]) -> [SKIP][266] ([Intel XE#2423]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][267] ([Intel XE#2244]) -> [SKIP][268] ([Intel XE#2890])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][269] ([Intel XE#1695]) -> [SKIP][270] ([Intel XE#2890])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][271] ([Intel XE#776]) -> [SKIP][272] ([Intel XE#2890])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][273] ([Intel XE#301]) -> [DMESG-FAIL][274] ([Intel XE#877])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][275] ([Intel XE#301]) -> [SKIP][276] ([Intel XE#2423])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][277] ([Intel XE#301]) -> [DMESG-WARN][278] ([Intel XE#877])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#2597]) -> [SKIP][280] ([Intel XE#2423])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][281] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][282] ([Intel XE#2890]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][283] ([Intel XE#2311]) -> [SKIP][284] ([Intel XE#2890]) +18 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][285] ([Intel XE#2333]) -> [SKIP][286] ([Intel XE#2890]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][287] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][288] ([Intel XE#2890]) +18 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][289] ([Intel XE#2313]) -> [SKIP][290] ([Intel XE#2890]) +20 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][291] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][292] ([Intel XE#1035])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_plane@pixel-format.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][293] ([Intel XE#1035]) -> [INCOMPLETE][294] ([Intel XE#1035] / [Intel XE#1195])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][295] ([Intel XE#2493]) -> [SKIP][296] ([Intel XE#2423])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][297] ([Intel XE#3177]) -> [SKIP][298] ([Intel XE#2423]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          [SKIP][299] ([Intel XE#2763]) -> [SKIP][300] ([Intel XE#2423]) +5 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][301] ([Intel XE#2391]) -> [SKIP][302] ([Intel XE#2890])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][303] ([Intel XE#2387]) -> [SKIP][304] ([Intel XE#2890])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][305] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][306] ([Intel XE#2890]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][307] ([Intel XE#2329]) -> [SKIP][308] ([Intel XE#2423]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][309] ([Intel XE#2330]) -> [SKIP][310] ([Intel XE#2423]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][311] ([Intel XE#3007]) -> [SKIP][312] ([Intel XE#2423]) +23 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_sequence@get-busy.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_sequence@get-busy.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][313] ([Intel XE#2426]) -> [SKIP][314] ([Intel XE#2423])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][315] ([Intel XE#1499]) -> [SKIP][316] ([Intel XE#2423])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          [SKIP][317] ([Intel XE#756]) -> [SKIP][318] ([Intel XE#2423])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][319] ([Intel XE#2905]) -> [SKIP][320] ([Intel XE#1130]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_eudebug@basic-read-event.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][321] ([Intel XE#1473]) -> [TIMEOUT][322] ([Intel XE#1473])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][323] ([Intel XE#2364]) -> [SKIP][324] ([Intel XE#1130])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][325] ([Intel XE#1473]) -> [SKIP][326] ([Intel XE#1130]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][327] ([Intel XE#2322]) -> [SKIP][328] ([Intel XE#1130]) +8 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][329] -> [SKIP][330] ([Intel XE#1130])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-bmg:          [DMESG-WARN][331] -> [SKIP][332] ([Intel XE#1130]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_threads@threads-hang-rebind-err.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][333] ([Intel XE#2248]) -> [SKIP][334] ([Intel XE#1130])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][335] ([Intel XE#1420]) -> [SKIP][336] ([Intel XE#1130])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][337] ([Intel XE#2557]) -> [SKIP][338] ([Intel XE#2427])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_peer2peer@write.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][339] ([Intel XE#944]) -> [SKIP][340] ([Intel XE#1130])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306 -> xe-pw-140386v3

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306
  xe-pw-140386v3: 140386v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/index.html

--===============7823090839867854543==
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
<tr><td><b>Series:</b></td><td>drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140386/">https://patchwork.freedesktop.org/series/140386/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full -&gt; xe-pw-140386v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140386v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140386v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140386v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-466/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full and xe-pw-140386v3_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_rpm@universal-planes@plane-41:<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.71, 15.73] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140386v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-4/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +182 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-dp-2.html">PASS</a> +120 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-3/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@kms_content_protection@atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_content_protection@legacy.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_exec_threads@threads-hang-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557">Intel XE#2557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140386v3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306 -&gt; xe-pw-140386v3</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306<br />
  xe-pw-140386v3: 140386v3</p>

</body>
</html>

--===============7823090839867854543==--
