Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C674CF044A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E044C10E6D8;
	Wed,  9 Oct 2024 10:55:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CE310E6D8;
 Wed,  9 Oct 2024 10:55:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0153976939101451774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2lpg=3A_Add_WA_1501658?=
 =?utf-8?q?9081_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 10:55:22 -0000
Message-ID: <172847132292.1209005.12588257596822715626@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
In-Reply-To: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
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

--===============0153976939101451774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2lpg: Add WA 15016589081 (rev2)
URL   : https://patchwork.freedesktop.org/series/139297/
State : failure

== Summary ==

CI Bug Log - changes from xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029_full -> xe-pw-139297v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139297v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139297v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139297v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-adlp:         [PASS][9] -> [TIMEOUT][10] +2 other tests timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  
#### Warnings ####

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][11] ([Intel XE#958]) -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - {shard-bmg}:        [PASS][13] -> [FAIL][14] +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  
Known issues
------------

  Here are the changes found in xe-pw-139297v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#1195]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1475])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#886]) +2 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#2953])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - shard-lnl:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#2622]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#324]) +7 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#324]) +1 other test dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2763]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#2029])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_vblank@ts-continuation-idle:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][40] -> [ABORT][41] ([Intel XE#1034])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
    - shard-lnl:          [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2712])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2860])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#2159]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#2667]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-idle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#688])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][51] -> [DMESG-WARN][52] ([Intel XE#358])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][53] -> [DMESG-FAIL][54] ([Intel XE#1620]) +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [PASS][55] -> [ABORT][56] ([Intel XE#1358])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][57] -> [ABORT][58] ([Intel XE#1358])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][59] -> [ABORT][60] ([Intel XE#1794])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][61] -> [ABORT][62] ([Intel XE#1794])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [DMESG-WARN][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][65] ([Intel XE#1701]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][67] ([Intel XE#1659]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - {shard-bmg}:        [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][71] ([Intel XE#877]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][73] ([Intel XE#1475]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-adlp:         [FAIL][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][77] -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][79] ([Intel XE#886]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#301]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][83] ([Intel XE#324]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
    - shard-lnl:          [DMESG-FAIL][85] ([Intel XE#324]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][87] ([Intel XE#616]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-435/igt@kms_plane_cursor@viewport.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][89] ([Intel XE#2948]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][91] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#1473]) -> [PASS][94] +2 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [DMESG-WARN][95] -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-lnl:          [INCOMPLETE][97] ([Intel XE#1169]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][99] ([Intel XE#1620]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][101] ([Intel XE#1204]) -> [DMESG-FAIL][102] ([Intel XE#324])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [TIMEOUT][103] ([Intel XE#402]) -> [FAIL][104] ([Intel XE#1231])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][105] ([Intel XE#324]) -> [FAIL][106] ([Intel XE#1231]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][107] ([Intel XE#1231]) -> [TIMEOUT][108] ([Intel XE#402])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][109] ([Intel XE#2947]) -> [FAIL][110] ([Intel XE#2883])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-4/igt@kms_setmode@basic@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#362]) -> [SKIP][112] ([Intel XE#1500])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          [TIMEOUT][113] ([Intel XE#1358]) -> [SKIP][114] ([Intel XE#2284] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2860]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2860
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2947
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029 -> xe-pw-139297v2

  IGT_8061: 8061
  xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029: c8e01f4159a790812aa3c38cf659d6480fc7d029
  xe-pw-139297v2: 139297v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/index.html

--===============0153976939101451774==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2lpg: Add WA 15016589081 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139297/">https://patchwork.freedesktop.org/series/139297/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029_full -&gt; xe-pw-139297v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139297v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139297v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139297v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-6.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm_residency@toggle-gt-c6:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139297v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_vblank@ts-continuation-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712">Intel XE#2712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2860">Intel XE#2860</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-1/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-435/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-8/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-4/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2947">Intel XE#2947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139297v2/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029 -&gt; xe-pw-139297v2</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2027-c8e01f4159a790812aa3c38cf659d6480fc7d029: c8e01f4159a790812aa3c38cf659d6480fc7d029<br />
  xe-pw-139297v2: 139297v2</p>

</body>
</html>

--===============0153976939101451774==--
