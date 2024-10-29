Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE3D3A672
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 16:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A68D10E29D;
	Tue, 29 Oct 2024 16:40:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EF110E29D;
 Tue, 29 Oct 2024 16:40:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1336166650227543342=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/psr=3A_WA_for_panels_s?=
 =?utf-8?q?tating_bad_link_status_after_PSR_is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 16:40:38 -0000
Message-ID: <173022003804.1359386.2857285416885362212@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029122415.1789528-1-jouni.hogander@intel.com>
In-Reply-To: <20241029122415.1789528-1-jouni.hogander@intel.com>
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

--===============1336166650227543342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: WA for panels stating bad link status after PSR is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/140571/
State : failure

== Summary ==

CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -> xe-pw-140571v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140571v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140571v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140571v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +3 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [FAIL][10] +2 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][12] +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-bmg:          [PASS][16] -> [FAIL][17] +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#3225]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][20] ([Intel XE#2327]) -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][22] ([Intel XE#1124]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][24] ([Intel XE#2328]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][26] ([Intel XE#2887]) -> [SKIP][27] +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][28] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][30] ([Intel XE#2311]) -> [SKIP][31] +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [FAIL][32] ([Intel XE#2333]) -> [INCOMPLETE][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [FAIL][34] ([Intel XE#2333]) -> [SKIP][35] +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][36] ([Intel XE#2313]) -> [SKIP][37] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][38] ([Intel XE#2231]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][40] ([Intel XE#1489]) -> [SKIP][41] +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][42] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][43] +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][44] ([Intel XE#2948]) -> [FAIL][45] +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-bmg:          [SKIP][46] ([Intel XE#2423]) -> [INCOMPLETE][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][48] ([Intel XE#1130]) -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-140571v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2134])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@fbdev@unaligned-read.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][52] -> [DMESG-FAIL][53] ([Intel XE#1033] / [Intel XE#1727])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#877]) +1 other test dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1124]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][57] ([Intel XE#3162])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2890]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1124])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#1231] / [Intel XE#1242])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1124]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#619])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#367])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#367])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#367])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#787]) +34 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#787]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2890]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#2907])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2887]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#616]) +8 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#1195] / [Intel XE#1727])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][77] -> [INCOMPLETE][78] ([Intel XE#1195])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][79] ([Intel XE#1195])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2652] / [Intel XE#787]) +23 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#314]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#306])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#373]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2252])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#373])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#373]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_color@ctm-0-25@pipe-a-edp-1:
    - shard-lnl:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#2929]) +1 other test dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-a-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_color@ctm-0-25@pipe-a-edp-1.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#1178]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#1178]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1424]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2055]) +1 other test dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#309]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#309]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#3007]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_legacy@forked-move.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_legacy@forked-move.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [PASS][100] -> [FAIL][101] ([Intel XE#1541])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#2141]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2244])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#455]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2244])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#776])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#701])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1138])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1137])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#310]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][111] -> [FAIL][112] ([Intel XE#301]) +2 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][113] -> [FAIL][114] ([Intel XE#301])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1421])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][116] -> [ABORT][117] ([Intel XE#2625])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#886]) +8 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1397] / [Intel XE#1745])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1397])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2293]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#455]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#651]) +14 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2311])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#656]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#651]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][128] -> [FAIL][129] ([Intel XE#1861])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#2890]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#2351] / [Intel XE#2890])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2351] / [Intel XE#2890])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#651]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#656]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#653]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#653]) +16 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2313])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1339])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2423])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#455])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#346])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2927])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2927])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@multimaster-lease:
    - shard-adlp:         [PASS][147] -> [DMESG-WARN][148] ([Intel XE#1033] / [Intel XE#1727])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_lease@multimaster-lease.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_lease@multimaster-lease.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][149] -> [SKIP][150] ([Intel XE#2423]) +71 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [PASS][151] -> [DMESG-WARN][152] ([Intel XE#2953] / [Intel XE#3086])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_cursor@viewport:
    - shard-lnl:          [PASS][153] -> [FAIL][154] ([Intel XE#1471])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_plane_cursor@viewport.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
    - shard-lnl:          [PASS][155] -> [FAIL][156] ([Intel XE#1874])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#599]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][158] -> [FAIL][159] ([Intel XE#1874]) +3 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2763]) +15 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2763]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2763]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#870])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#870])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#718])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][168] -> [FAIL][169] ([Intel XE#1430])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [PASS][170] -> [SKIP][171] ([Intel XE#2446])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][172] -> [SKIP][173] ([Intel XE#2446]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#1489]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#2893])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#1489])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][178] -> [FAIL][179] ([Intel XE#2948]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#2939])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     [PASS][183] -> [SKIP][184] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_rmfb@close-fd.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1437])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][186] -> [FAIL][187] ([Intel XE#2883]) +2 other tests fail
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#330])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][189] -> [FAIL][190] ([Intel XE#899])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][191] -> [FAIL][192] ([Intel XE#1523]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#1499])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#756])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#756])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][196] ([Intel XE#1050])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1280] / [Intel XE#455])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#1123])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#1126])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
    - shard-dg2-set2:     [PASS][200] -> [SKIP][201] ([Intel XE#1130]) +21 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#2905]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#1130]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2905]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][205] -> [TIMEOUT][206] ([Intel XE#1473] / [Intel XE#402])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#261] / [Intel XE#688])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#688]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#1392]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#1392])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][211] ([Intel XE#288]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][212] -> [FAIL][213] ([Intel XE#3160]) +1 other test fail
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#288]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#2360])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#2905]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][217] -> [DMESG-WARN][218] ([Intel XE#3184])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#1416])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@xe_mmap@vram.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][220] -> [FAIL][221] ([Intel XE#2136])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_module_load@reload.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#379])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#2541])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#2541]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#977])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][226] ([Intel XE#1173])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#2284])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][228] -> [ABORT][229] ([Intel XE#1358] / [Intel XE#1794])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_pm@s2idle-basic.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][230] ([Intel XE#1794])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-adlp:         [PASS][231] -> [ABORT][232] ([Intel XE#1794])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][233] -> [FAIL][234] ([Intel XE#958])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#944]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#944])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#944])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_tlb@basic-tlb:
    - shard-adlp:         [PASS][238] -> [CRASH][239] ([Intel XE#3212])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_tlb@basic-tlb.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@xe_tlb@basic-tlb.html
    - shard-bmg:          [PASS][240] -> [CRASH][241] ([Intel XE#3212])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_tlb@basic-tlb.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_tlb@basic-tlb.html
    - shard-lnl:          [PASS][242] -> [CRASH][243] ([Intel XE#3212])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_tlb@basic-tlb.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@large-split-misaligned-binds-67108864:
    - shard-adlp:         [PASS][244] -> [TIMEOUT][245] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@xe_vm@large-split-misaligned-binds-67108864.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-67108864.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-bmg:          [PASS][246] -> [SKIP][247] ([Intel XE#1130]) +170 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#1130]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][249] ([Intel XE#1885]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][251] ([Intel XE#2134]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@nullptr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][253] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][255] ([Intel XE#3194]) -> [PASS][256] +3 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][257] ([Intel XE#2890]) -> [PASS][258] +10 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][259] ([Intel XE#877]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][261] ([Intel XE#2231]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][263] -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][265] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][267] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][269] ([Intel XE#877]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_fb_coherency@memset-crc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][273] ([Intel XE#2882]) -> [PASS][274] +2 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][275] -> [PASS][276] +4 other tests pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#301]) -> [PASS][278] +7 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][279] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][281] ([Intel XE#1195]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][283] ([Intel XE#2423]) -> [PASS][284] +96 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][285] ([Intel XE#2882]) -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][287] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][289] ([Intel XE#2049]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][291] ([Intel XE#886]) -> [PASS][292] +7 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [PASS][294] +13 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][295] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][297] ([Intel XE#1874]) -> [PASS][298] +2 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][299] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][300] +1 other test pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][301] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][302] +4 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-negative.html
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2890]) -> [PASS][304] +6 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_dc@dc5-dpms-negative.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][305] ([Intel XE#2029]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][307] ([Intel XE#2446]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][309] ([Intel XE#2948]) -> [PASS][310] +3 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][311] ([Intel XE#3007]) -> [PASS][312] +11 other tests pass
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_sequence@get-busy.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_sequence@get-busy.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][313] ([Intel XE#899]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][315] ([Intel XE#2443]) -> [PASS][316] +3 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vrr@flipline.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@testdisplay.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@testdisplay.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][319] ([Intel XE#1473]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][321] ([Intel XE#1130]) -> [PASS][322] +206 other tests pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1130]) -> [PASS][324] +12 other tests pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][325] -> [PASS][326] +1 other test pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][327] -> [PASS][328] +1 other test pass
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-adlp:         [FAIL][329] ([Intel XE#1081]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_exec_reset@parallel-close-fd.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd.html
    - shard-dg2-set2:     [FAIL][331] ([Intel XE#1081]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][333] ([Intel XE#2687]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [SKIP][335] ([Intel XE#1192]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][337] ([Intel XE#2136]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][339] ([Intel XE#3184]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [ABORT][341] ([Intel XE#1358]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][343] ([Intel XE#1794]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][345] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][347] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [DMESG-FAIL][348] ([Intel XE#1033] / [Intel XE#1727])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#3007]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#873]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][353] ([Intel XE#2423]) -> [SKIP][354] ([Intel XE#2370])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][355] ([Intel XE#2231]) -> [SKIP][356] ([Intel XE#2327])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][357] ([Intel XE#2327]) -> [SKIP][358] ([Intel XE#2890]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#2231]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#316]) -> [SKIP][362] ([Intel XE#2351] / [Intel XE#2890])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][363] ([Intel XE#2890]) -> [SKIP][364] ([Intel XE#2327]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][365] ([Intel XE#3194]) -> [FAIL][366] ([Intel XE#1231] / [Intel XE#1242])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][367] ([Intel XE#1124]) -> [SKIP][368] ([Intel XE#2890]) +5 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][369] ([Intel XE#1124]) -> [SKIP][370] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1124]) -> [SKIP][372] ([Intel XE#2351] / [Intel XE#2890])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][373] ([Intel XE#2890]) -> [SKIP][374] ([Intel XE#610])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][375] -> [SKIP][376] ([Intel XE#1124]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][377] ([Intel XE#2890]) -> [SKIP][378] ([Intel XE#1124]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][379] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][380] ([Intel XE#1124])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1124]) -> [SKIP][382] ([Intel XE#2890]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][383] ([Intel XE#607]) -> [SKIP][384] ([Intel XE#2890]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][385] ([Intel XE#2423]) -> [SKIP][386] ([Intel XE#2314] / [Intel XE#2894])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][387] ([Intel XE#367]) -> [SKIP][388] ([Intel XE#2423])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][389] ([Intel XE#2423]) -> [SKIP][390] ([Intel XE#367])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][391] ([Intel XE#2231]) -> [SKIP][392] ([Intel XE#2887])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-bmg:          [SKIP][393] ([Intel XE#2887]) -> [SKIP][394] ([Intel XE#2231])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][395] ([Intel XE#2890]) -> [SKIP][396] ([Intel XE#2887]) +13 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][397] ([Intel XE#2887]) -> [SKIP][398] ([Intel XE#2890]) +11 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][399] ([Intel XE#2887]) -> [SKIP][400] ([Intel XE#2231] / [Intel XE#2890])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][401] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][402] ([Intel XE#2887])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2890]) -> [SKIP][404] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][405] -> [SKIP][406] ([Intel XE#2887])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][408] ([Intel XE#2890])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][409] ([Intel XE#2890]) -> [SKIP][410] ([Intel XE#2652] / [Intel XE#787]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][411] ([Intel XE#2890]) -> [SKIP][412] ([Intel XE#2724])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][413] ([Intel XE#2423]) -> [SKIP][414] ([Intel XE#2325])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][415] ([Intel XE#2325]) -> [SKIP][416] ([Intel XE#2423]) +3 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_color@degamma.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2423] / [i915#2575]) -> [SKIP][418] ([Intel XE#306])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_color@gamma.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][419] ([Intel XE#2423]) -> [SKIP][420] ([Intel XE#2252]) +9 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][421] ([Intel XE#2252]) -> [SKIP][422] ([Intel XE#2423]) +5 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][423] ([Intel XE#3007]) -> [SKIP][424] ([Intel XE#2252])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2423] / [i915#2575]) -> [SKIP][426] ([Intel XE#373])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][427] ([Intel XE#2423]) -> [FAIL][428] ([Intel XE#1178])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@atomic.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][429] ([Intel XE#2423]) -> [SKIP][430] ([Intel XE#2341]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][431] ([Intel XE#2423]) -> [SKIP][432] ([Intel XE#2390]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][433] ([Intel XE#1178]) -> [SKIP][434] ([Intel XE#2423])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_content_protection@legacy.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][435] ([Intel XE#3007]) -> [FAIL][436] ([Intel XE#1178])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_content_protection@srm.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_content_protection@srm.html
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2423] / [i915#2575]) -> [FAIL][438] ([Intel XE#1178])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_content_protection@srm.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][439] ([Intel XE#2320]) -> [SKIP][440] ([Intel XE#2423]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][441] ([Intel XE#2320]) -> [SKIP][442] ([Intel XE#3007]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#455]) -> [SKIP][444] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][445] ([Intel XE#2423]) -> [SKIP][446] ([Intel XE#2321])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][447] ([Intel XE#2423]) -> [SKIP][448] ([Intel XE#2320]) +3 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          [SKIP][449] ([Intel XE#3007]) -> [SKIP][450] ([Intel XE#2320])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2423] / [i915#2575]) -> [SKIP][452] ([Intel XE#308])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          [SKIP][453] ([Intel XE#3007]) -> [SKIP][454] ([Intel XE#2321])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][455] ([Intel XE#2321]) -> [SKIP][456] ([Intel XE#2423]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][457] ([Intel XE#2423]) -> [SKIP][458] ([Intel XE#2286])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][459] ([Intel XE#2286]) -> [SKIP][460] ([Intel XE#2423])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][461] ([Intel XE#2890]) -> [FAIL][462] ([Intel XE#2141])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][463] ([Intel XE#2423]) -> [SKIP][464] ([Intel XE#2323])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][465] ([Intel XE#2244]) -> [SKIP][466] ([Intel XE#2890])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_dsc@dsc-basic.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][467] ([Intel XE#2244]) -> [SKIP][468] ([Intel XE#2231] / [Intel XE#2890])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][469] ([Intel XE#2890]) -> [SKIP][470] ([Intel XE#2244])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][471] ([Intel XE#2374]) -> [SKIP][472] ([Intel XE#3007])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1135]) -> [SKIP][474] ([Intel XE#2423] / [i915#2575])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][475] ([Intel XE#886]) -> [FAIL][476] ([Intel XE#3255] / [Intel XE#886])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][477] ([Intel XE#3007]) -> [SKIP][478] ([Intel XE#2423]) +4 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][479] ([Intel XE#886]) -> [FAIL][480] ([Intel XE#3149] / [Intel XE#886])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][481] ([Intel XE#301]) -> [SKIP][482] ([Intel XE#2423]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][483] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][484] ([Intel XE#2890]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][485] -> [SKIP][486] ([Intel XE#2293] / [Intel XE#2380])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][487] ([Intel XE#2890]) -> [SKIP][488] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][489] ([Intel XE#2311]) -> [SKIP][490] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][491] ([Intel XE#2890]) -> [SKIP][492] ([Intel XE#2311]) +29 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][493] -> [SKIP][494] ([Intel XE#2311]) +2 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][495] ([Intel XE#2231]) -> [SKIP][496] ([Intel XE#2311]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][498] ([Intel XE#651])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#651]) -> [SKIP][500] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][501] ([Intel XE#2890]) -> [SKIP][502] ([Intel XE#2231] / [Intel XE#2890]) +6 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][503] ([Intel XE#2333]) -> [SKIP][504] ([Intel XE#2890]) +11 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][505] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][506] ([Intel XE#2333])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][507] ([Intel XE#1861]) -> [TIMEOUT][508] ([Intel XE#1033] / [Intel XE#1727])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][509] ([Intel XE#2333]) -> [SKIP][510] ([Intel XE#2231])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][511] ([Intel XE#2890]) -> [FAIL][512] ([Intel XE#2333]) +12 other tests fail
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][513] -> [FAIL][514] ([Intel XE#2333]) +1 other test fail
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][515] ([Intel XE#2311]) -> [SKIP][516] ([Intel XE#2231]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#651]) -> [SKIP][518] ([Intel XE#2890]) +2 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][519] ([Intel XE#2311]) -> [SKIP][520] ([Intel XE#2890]) +16 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][521] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][522] ([Intel XE#656])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#2890]) -> [SKIP][524] ([Intel XE#651]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
    - shard-bmg:          [SKIP][525] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][526] ([Intel XE#2311]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][527] ([Intel XE#2313]) -> [SKIP][528] ([Intel XE#2231] / [Intel XE#2890]) +3 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][529] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][530] ([Intel XE#2313]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][531] -> [SKIP][532] ([Intel XE#2313]) +2 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
    - shard-adlp:         [SKIP][533] ([Intel XE#656]) -> [TIMEOUT][534] ([Intel XE#1033] / [Intel XE#1727])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][535] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][536] ([Intel XE#2890]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#2890]) -> [SKIP][538] ([Intel XE#653]) +4 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][539] ([Intel XE#2890]) -> [SKIP][540] ([Intel XE#2313]) +27 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][541] ([Intel XE#2890]) -> [SKIP][542] ([Intel XE#2352]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][543] ([Intel XE#2333]) -> [SKIP][544] ([Intel XE#2231] / [Intel XE#2890]) +3 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#455]) -> [SKIP][546] ([Intel XE#2890]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][547] ([Intel XE#2313]) -> [SKIP][548] ([Intel XE#2890]) +21 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][549] ([Intel XE#2231]) -> [SKIP][550] ([Intel XE#2313])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#653]) -> [SKIP][552] ([Intel XE#2890]) +4 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#653]) -> [SKIP][554] ([Intel XE#2351] / [Intel XE#2890])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][555] ([Intel XE#2340]) -> [SKIP][556] ([Intel XE#2423])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][557] ([Intel XE#2890]) -> [SKIP][558] ([Intel XE#2927])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][559] ([Intel XE#2890]) -> [SKIP][560] ([Intel XE#2934])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][561] ([Intel XE#2423]) -> [SKIP][562] ([Intel XE#2486])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][563] ([Intel XE#2423]) -> [SKIP][564] ([Intel XE#2393])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][565] ([Intel XE#2423]) -> [SKIP][566] ([Intel XE#2493]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][567] ([Intel XE#2423]) -> [SKIP][568] ([Intel XE#2763]) +3 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-bmg:          [SKIP][569] ([Intel XE#2763]) -> [SKIP][570] ([Intel XE#2423]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][571] ([Intel XE#2763]) -> [SKIP][572] ([Intel XE#3007])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][574] ([Intel XE#2423] / [i915#2575])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][575] ([Intel XE#2890]) -> [SKIP][576] ([Intel XE#2938])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][577] ([Intel XE#2392]) -> [SKIP][578] ([Intel XE#2890])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [SKIP][579] ([Intel XE#2890]) -> [FAIL][580] ([Intel XE#1430])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][581] ([Intel XE#2446]) -> [SKIP][582] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2890]) -> [SKIP][584] ([Intel XE#1489])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][585] ([Intel XE#1489]) -> [SKIP][586] ([Intel XE#2890])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][587] ([Intel XE#2890]) -> [SKIP][588] ([Intel XE#1489]) +6 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][589] -> [SKIP][590] ([Intel XE#1489]) +3 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][591] ([Intel XE#1489]) -> [SKIP][592] ([Intel XE#2231] / [Intel XE#2890])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1489]) -> [SKIP][594] ([Intel XE#2890])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][595] ([Intel XE#2890]) -> [SKIP][596] ([Intel XE#2387]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][597] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][598] ([Intel XE#2890]) +12 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-bmg:          [SKIP][599] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][600] ([Intel XE#2231])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-render.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-render.html
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][602] ([Intel XE#2890])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-render.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][604] ([Intel XE#2850] / [Intel XE#929])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-bmg:          [SKIP][605] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][606] ([Intel XE#2234] / [Intel XE#2850])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@fbc-psr-no-drrs.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][607] -> [SKIP][608] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          [SKIP][609] ([Intel XE#2890]) -> [SKIP][610] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][611] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][612] ([Intel XE#2231] / [Intel XE#2890])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][614] ([Intel XE#2351])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][615] ([Intel XE#2330]) -> [SKIP][616] ([Intel XE#2423])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][617] ([Intel XE#2423]) -> [SKIP][618] ([Intel XE#2329])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][619] ([Intel XE#2329]) -> [SKIP][620] ([Intel XE#2423])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][621] ([Intel XE#2426]) -> [SKIP][622] ([Intel XE#2423])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][623] ([Intel XE#2450]) -> [SKIP][624] ([Intel XE#2423])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][625] ([Intel XE#1499]) -> [SKIP][626] ([Intel XE#2423])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_vrr@flip-dpms.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][627] ([Intel XE#2168]) -> [SKIP][628] ([Intel XE#2423])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_vrr@lobf.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][629] ([Intel XE#2423]) -> [SKIP][630] ([Intel XE#1499])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][631] ([Intel XE#756]) -> [SKIP][632] ([Intel XE#2423]) +1 other test skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1130]) -> [SKIP][634] ([Intel XE#1280] / [Intel XE#455])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][635] ([Intel XE#1130]) -> [SKIP][636] ([Intel XE#2905]) +11 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-read-event.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1130]) -> [SKIP][638] ([Intel XE#2905])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][639] ([Intel XE#2905]) -> [SKIP][640] ([Intel XE#1130]) +8 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_eudebug_online@single-step.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_eudebug_online@single-step.html
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#2905]) -> [SKIP][642] ([Intel XE#1130])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_eudebug_online@single-step.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][643] ([Intel XE#1473]) -> [SKIP][644] ([Intel XE#1130])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [SKIP][645] ([Intel XE#1130]) -> [FAIL][646] ([Intel XE#2364])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][647] ([Intel XE#1473] / [Intel XE#2472]) -> [SKIP][648] ([Intel XE#1130])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][649] ([Intel XE#2322]) -> [SKIP][650] ([Intel XE#1130]) +11 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][651] ([Intel XE#1130]) -> [SKIP][652] ([Intel XE#2322]) +12 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#1130]) -> [SKIP][654] ([Intel XE#288]) +2 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][655] -> [SKIP][656] ([Intel XE#1130])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#288]) -> [SKIP][658] ([Intel XE#1130]) +2 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#1130]) -> [SKIP][660] ([Intel XE#2360])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1130]) -> [SKIP][662] ([Intel XE#2541])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][663] ([Intel XE#1130]) -> [SKIP][664] ([Intel XE#2248])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][665] ([Intel XE#1420]) -> [SKIP][666] ([Intel XE#1130])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][667] ([Intel XE#2557]) -> [SKIP][668] ([Intel XE#2427])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_peer2peer@write.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_peer2peer@write.html
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#1061]) -> [FAIL][670] ([Intel XE#1173])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_peer2peer@write.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][671] ([Intel XE#1130]) -> [SKIP][672] ([Intel XE#2284])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][673] ([Intel XE#2284]) -> [SKIP][674] ([Intel XE#1130])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#2284]) -> [SKIP][676] ([Intel XE#1130])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][677] ([Intel XE#1130]) -> [SKIP][678] ([Intel XE#579])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][679] ([Intel XE#944]) -> [SKIP][680] ([Intel XE#1130])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][681] ([Intel XE#1130]) -> [SKIP][682] ([Intel XE#944]) +1 other test skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][683] ([Intel XE#2919]) -> [SKIP][684] ([Intel XE#1130])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_wedged@basic-wedged.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

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
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
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
  * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-pw-140571v2

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
  xe-pw-140571v2: 140571v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html

--===============1336166650227543342==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: WA for panels stating bad link status after PSR is enabled (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140571/">https://patchwork.freedesktop.org/series/140571/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -&gt; xe-pw-140571v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140571v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140571v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140571v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140571v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_color@ctm-0-25@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_legacy@forked-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_legacy@forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_cursor_legacy@forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_lease@multimaster-lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_lease@multimaster-lease.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_rmfb@close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-8/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_tlb@basic-tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@xe_vm@large-split-misaligned-binds-67108864.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-67108864.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@core_hotunplug@hotreplug.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +96 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_sequence@get-busy.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +206 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@xe_exec_reset@parallel-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-7/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_pm@s3-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3255">Intel XE#3255</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-4/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2557">Intel XE#2557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140571v2/shard-bmg-5/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGT_8087</li>
<li>Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -&gt; xe-pw-140571v2</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab<br />
  xe-pw-140571v2: 140571v2</p>

</body>
</html>

--===============1336166650227543342==--
