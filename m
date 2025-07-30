Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945C4C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 13:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5737610E1FA;
	Wed, 30 Jul 2025 13:25:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EAA10E1FA;
 Wed, 30 Jul 2025 13:25:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7965753297512960461=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_User_readable_error_codes_?=
 =?utf-8?q?on_atomic=5Fioctl_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 13:25:39 -0000
Message-ID: <175388193990.199285.2544082703958758103@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
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

--===============7965753297512960461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: User readable error codes on atomic_ioctl failure
URL   : https://patchwork.freedesktop.org/series/152277/
State : failure

== Summary ==

CI Bug Log - changes from xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe_FULL -> xe-pw-152277v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152277v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152277v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152277v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@atomic-invalid-params:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-3/igt@kms_atomic@atomic-invalid-params.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-3/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-6/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-1/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][5] +257 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7] +868 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html

  * igt@kms_flip@bo-too-big@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][8] +292 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_flip@bo-too-big@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +421 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-a:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right@pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right@pipe-a.html

  * igt@kms_plane@plane-panning-top-left@pipe-b:
    - shard-bmg:          [PASS][14] -> [SKIP][15] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_plane@plane-panning-top-left@pipe-b.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-top-left@pipe-b.html

  * igt@kms_setmode@basic:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] +3 other tests incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@kms_setmode@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-464/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] +2 other tests incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          [SKIP][20] ([Intel XE#4950]) -> [FAIL][21] +39 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][22] ([Intel XE#2316]) -> [FAIL][23] +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][24] ([Intel XE#5390]) -> [FAIL][25] +37 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][26] ([Intel XE#2312]) -> [FAIL][27] +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][28] ([Intel XE#4947]) -> [FAIL][29] +22 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-bmg:          [SKIP][30] ([Intel XE#4950]) -> [SKIP][31] +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_plane@plane-position-hole-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][32] ([Intel XE#4741]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][34] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][36] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [FAIL][37] +3 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][38] ([Intel XE#4962]) -> [FAIL][39] +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][40] ([Intel XE#1435]) -> [INCOMPLETE][41] +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg2-set2:     [SKIP][42] ([Intel XE#455]) -> [INCOMPLETE][43] +1 other test incomplete
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-433/igt@kms_setmode@basic-clone-single-crtc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][44] ([Intel XE#5694]) -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@xe_pm@d3cold-i2c.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-464/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][46] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][47] +7 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][48] ([Intel XE#2284]) -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-bmg:          [SKIP][50] ([Intel XE#4945]) -> [FAIL][51] +3 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pm@d3hot-basic-exec.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     [SKIP][52] ([Intel XE#5695]) -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-433/igt@xe_pm@d3hot-i2c.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][54] ([Intel XE#5695]) -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][56] ([Intel XE#2284]) -> [FAIL][57] +4 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pipe_stress@stress-xrgb8888-4tiled}:
    - shard-bmg:          [PASS][58] -> [FAIL][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-dg2-set2:     [PASS][60] -> [FAIL][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  
Known issues
------------

  Here are the changes found in xe-pw-152277v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#4963])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2134]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@fbdev@info.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@fbdev@info.html

  * igt@kms_addfb_basic@size-max:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4950]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_addfb_basic@size-max.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#4912]) +6 other tests incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#4912])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-dg2-set2:     [PASS][70] -> [INCOMPLETE][71] ([Intel XE#4912]) +11 other tests incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#316])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#4947]) +12 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1124]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][76] -> [DMESG-FAIL][77] ([Intel XE#4543])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#367])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#787]) +167 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][80] -> [INCOMPLETE][81] ([Intel XE#3862]) +1 other test incomplete
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2907]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][87] -> [INCOMPLETE][88] ([Intel XE#3124])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][89] -> [DMESG-WARN][90] ([Intel XE#1727] / [Intel XE#3113])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4416]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#373]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][93] ([Intel XE#1178]) +2 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#1178]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#1188])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#2291]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][98] -> [FAIL][99] ([Intel XE#1475])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#1340])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-blocking-wf_vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#3149])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#3333]) +2 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#2316]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#4950]) +71 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][109] -> [FAIL][110] ([Intel XE#3149]) +4 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][111] -> [DMESG-WARN][112] ([Intel XE#4543]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][113] -> [DMESG-WARN][114] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][115] -> [FAIL][116] ([Intel XE#3149]) +7 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#455]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2293]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#651]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#658])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#653])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#4947]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-dg2-set2:     [PASS][123] -> [FAIL][124] ([Intel XE#4427])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-b:
    - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#455]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right@pipe-b.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right@pipe-b.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#5377])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_plane@plane-panning-top-left.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#4962]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1489]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2850] / [Intel XE#929])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1127])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#3414])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][135] ([Intel XE#1729])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#4445]) +7 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@kms_vblank@accuracy-idle.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_vblank@accuracy-idle.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4837]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][139] -> [SKIP][140] ([Intel XE#1392]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4945]) +24 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#4915]) +37 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-shared.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#3573]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-adlp:         [PASS][145] -> [DMESG-WARN][146] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#569])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@xe_pm@s3-vm-bind-unbind-all.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4733])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][148] -> [SKIP][149] ([Intel XE#4945]) +392 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_spin_batch@spin-all.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][150] ([Intel XE#4963]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][152] ([Intel XE#4672]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][154] ([Intel XE#2134]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@fbdev@nullptr.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@fbdev@nullptr.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][156] ([Intel XE#4947]) -> [PASS][157] +27 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][160] ([Intel XE#2291]) -> [PASS][161] +2 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][162] ([Intel XE#4633]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [SKIP][164] ([Intel XE#4950]) -> [PASS][165] +71 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#4543]) -> [PASS][167] +3 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][168] ([Intel XE#301]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][170] ([Intel XE#2571]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][172] ([Intel XE#718]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][175] +5 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][176] ([Intel XE#4459]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1392]) -> [PASS][179] +6 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][180] ([Intel XE#3876]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][182] ([Intel XE#5018]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [SKIP][184] ([Intel XE#4945]) -> [PASS][185] +608 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][186] ([Intel XE#3876]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][188] ([Intel XE#5679]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_module_load@many-reload.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_module_load@many-reload.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][190] ([Intel XE#4819]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-bmg:          [SKIP][192] ([Intel XE#4950]) -> [INCOMPLETE][193] ([Intel XE#4912]) +3 other tests incomplete
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_async_flips@test-cursor-atomic.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][194] ([Intel XE#2370]) -> [SKIP][195] ([Intel XE#4950])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#2327]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][198] ([Intel XE#2327]) -> [SKIP][199] ([Intel XE#4947]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][200] ([Intel XE#1124]) -> [SKIP][201] ([Intel XE#4947]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][202] ([Intel XE#4947]) -> [SKIP][203] ([Intel XE#1124]) +19 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][204] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][205] ([Intel XE#4950])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][206] ([Intel XE#4950]) -> [SKIP][207] ([Intel XE#2314] / [Intel XE#2894])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][208] ([Intel XE#4950]) -> [SKIP][209] ([Intel XE#367]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][210] ([Intel XE#367]) -> [SKIP][211] ([Intel XE#4950]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][212] ([Intel XE#4947]) -> [SKIP][213] ([Intel XE#2887]) +22 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][214] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][215] ([Intel XE#4947]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][216] ([Intel XE#2887]) -> [SKIP][217] ([Intel XE#4947]) +12 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][218] ([Intel XE#4947]) -> [SKIP][219] ([Intel XE#3432]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][220] ([Intel XE#3432]) -> [SKIP][221] ([Intel XE#4947]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][222] ([Intel XE#4947]) -> [SKIP][223] ([Intel XE#2652] / [Intel XE#787])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][224] ([Intel XE#4947]) -> [SKIP][225] ([Intel XE#2724])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][226] ([Intel XE#4950]) -> [SKIP][227] ([Intel XE#2325])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][228] ([Intel XE#2325]) -> [SKIP][229] ([Intel XE#4950]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_chamelium_color@degamma.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          [SKIP][230] ([Intel XE#4950]) -> [SKIP][231] ([Intel XE#2252]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][232] ([Intel XE#2252]) -> [SKIP][233] ([Intel XE#4950]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][234] ([Intel XE#4950]) -> [FAIL][235] ([Intel XE#1178]) +2 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][236] ([Intel XE#1178]) -> [SKIP][237] ([Intel XE#2341])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][238] ([Intel XE#4950]) -> [INCOMPLETE][239] ([Intel XE#2715] / [Intel XE#4907])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@legacy.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#1178]) -> [INCOMPLETE][241] ([Intel XE#2715] / [Intel XE#4907])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_content_protection@legacy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][242] ([Intel XE#4950]) -> [SKIP][243] ([Intel XE#2341])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][244] ([Intel XE#1188]) -> [SKIP][245] ([Intel XE#2341])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_content_protection@uevent.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][246] ([Intel XE#2321]) -> [SKIP][247] ([Intel XE#4950]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][248] ([Intel XE#4950]) -> [SKIP][249] ([Intel XE#2320]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][250] ([Intel XE#4950]) -> [SKIP][251] ([Intel XE#2321])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][252] ([Intel XE#2320]) -> [SKIP][253] ([Intel XE#4950]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][254] ([Intel XE#2286]) -> [SKIP][255] ([Intel XE#4950])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][256] ([Intel XE#4947]) -> [SKIP][257] ([Intel XE#1508]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][258] ([Intel XE#3009]) -> [SKIP][259] ([Intel XE#4950])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_dp_aux_dev.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#4354])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][262] ([Intel XE#2244]) -> [SKIP][263] ([Intel XE#4947]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_dsc@dsc-basic.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][264] ([Intel XE#4945]) -> [SKIP][265] ([Intel XE#4422]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][266] ([Intel XE#776]) -> [SKIP][267] ([Intel XE#4947])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_fbcon_fbt@psr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][268] ([Intel XE#4947]) -> [SKIP][269] ([Intel XE#776])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][270] ([Intel XE#4950]) -> [SKIP][271] ([Intel XE#2373])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][272] ([Intel XE#4950]) -> [SKIP][273] ([Intel XE#1138])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][274] ([Intel XE#2375]) -> [SKIP][275] ([Intel XE#4950])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][276] ([Intel XE#4950]) -> [SKIP][277] ([Intel XE#2374])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][278] ([Intel XE#2374]) -> [SKIP][279] ([Intel XE#4950])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_feature_discovery@psr2.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [SKIP][280] ([Intel XE#2316]) -> [FAIL][281] ([Intel XE#3333])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][282] ([Intel XE#4950]) -> [FAIL][283] ([Intel XE#3333])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][284] ([Intel XE#2316]) -> [SKIP][285] ([Intel XE#4950]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-bmg:          [SKIP][286] ([Intel XE#4950]) -> [FAIL][287] ([Intel XE#3149]) +4 other tests fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip@dpms-off-confusion-interruptible.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#5208]) -> [DMESG-WARN][289] ([Intel XE#4543] / [Intel XE#5208])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][290] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][291] ([Intel XE#4947]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][292] ([Intel XE#4947]) -> [SKIP][293] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][294] ([Intel XE#2311]) -> [SKIP][295] ([Intel XE#4947]) +24 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][296] ([Intel XE#4947]) -> [SKIP][297] ([Intel XE#2311]) +44 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][298] ([Intel XE#2311]) -> [SKIP][299] ([Intel XE#2312]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][300] ([Intel XE#4947]) -> [SKIP][301] ([Intel XE#5427])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][302] ([Intel XE#5390]) -> [SKIP][303] ([Intel XE#4947]) +10 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][304] ([Intel XE#2312]) -> [SKIP][305] ([Intel XE#4947]) +11 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][306] ([Intel XE#5390]) -> [SKIP][307] ([Intel XE#2312]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#2311]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][310] ([Intel XE#2352]) -> [SKIP][311] ([Intel XE#4947])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][312] ([Intel XE#2313]) -> [SKIP][313] ([Intel XE#4947]) +22 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][314] ([Intel XE#2312]) -> [SKIP][315] ([Intel XE#2313]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][316] ([Intel XE#2313]) -> [SKIP][317] ([Intel XE#2312]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#4947]) -> [SKIP][319] ([Intel XE#2313]) +41 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][320] ([Intel XE#4947]) -> [SKIP][321] ([Intel XE#4298])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][322] ([Intel XE#346]) -> [SKIP][323] ([Intel XE#4947])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][324] ([Intel XE#4947]) -> [SKIP][325] ([Intel XE#4329])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [SKIP][326] ([Intel XE#4950]) -> [SKIP][327] ([Intel XE#5377])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][328] ([Intel XE#4596]) -> [SKIP][329] ([Intel XE#4950])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][330] ([Intel XE#5021]) -> [SKIP][331] ([Intel XE#4950])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][332] ([Intel XE#2763]) -> [SKIP][333] ([Intel XE#4950])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][334] ([Intel XE#4947]) -> [SKIP][335] ([Intel XE#870])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][336] ([Intel XE#4947]) -> [SKIP][337] ([Intel XE#2938])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][338] ([Intel XE#870]) -> [SKIP][339] ([Intel XE#4947])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_pm_backlight@fade.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][340] ([Intel XE#4947]) -> [SKIP][341] ([Intel XE#2392])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][342] ([Intel XE#4947]) -> [SKIP][343] ([Intel XE#3309])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][344] ([Intel XE#2392]) -> [SKIP][345] ([Intel XE#4947])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][346] ([Intel XE#2505]) -> [SKIP][347] ([Intel XE#4947])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][348] ([Intel XE#4947]) -> [SKIP][349] ([Intel XE#2499])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][350] ([Intel XE#1489]) -> [SKIP][351] ([Intel XE#4947]) +6 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][352] ([Intel XE#4947]) -> [SKIP][353] ([Intel XE#1489]) +12 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][354] ([Intel XE#4947]) -> [SKIP][355] ([Intel XE#2387])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][356] ([Intel XE#2387]) -> [SKIP][357] ([Intel XE#4947])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][358] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][359] ([Intel XE#4947]) +14 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][360] ([Intel XE#4947]) -> [SKIP][361] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][362] ([Intel XE#4947]) -> [SKIP][363] ([Intel XE#2414]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][364] ([Intel XE#4950]) -> [SKIP][365] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][366] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][367] ([Intel XE#4950]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][368] ([Intel XE#2330]) -> [SKIP][369] ([Intel XE#4950])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][370] ([Intel XE#4950]) -> [SKIP][371] ([Intel XE#2330]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][372] ([Intel XE#2413]) -> [SKIP][373] ([Intel XE#4950])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][374] ([Intel XE#4950]) -> [SKIP][375] ([Intel XE#2426])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][376] ([Intel XE#4950]) -> [SKIP][377] ([Intel XE#1499])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_vrr@flip-basic.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][378] ([Intel XE#4950]) -> [SKIP][379] ([Intel XE#2168])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_vrr@lobf.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][380] ([Intel XE#1499]) -> [SKIP][381] ([Intel XE#4950]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][382] ([Intel XE#2504]) -> [SKIP][383] ([Intel XE#4945])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][384] ([Intel XE#4837]) -> [SKIP][385] ([Intel XE#4945]) +12 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][386] ([Intel XE#4945]) -> [SKIP][387] ([Intel XE#4837]) +18 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][388] ([Intel XE#4945]) -> [SKIP][389] ([Intel XE#2322]) +13 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][390] ([Intel XE#2322]) -> [SKIP][391] ([Intel XE#4945]) +6 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][392] ([Intel XE#4943]) -> [SKIP][393] ([Intel XE#4945]) +12 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][394] ([Intel XE#4945]) -> [SKIP][395] ([Intel XE#4943]) +34 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [ABORT][396] ([Intel XE#5530]) -> [SKIP][397] ([Intel XE#4945])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][398] ([Intel XE#4945]) -> [SKIP][399] ([Intel XE#586])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_mmap@small-bar.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][400] ([Intel XE#4945]) -> [SKIP][401] ([Intel XE#1420])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][402] ([Intel XE#2245]) -> [SKIP][403] ([Intel XE#4945])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_pat@pat-index-xelp.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][404] ([Intel XE#1173]) -> [SKIP][405] ([Intel XE#1061])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@xe_peer2peer@read.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][406] ([Intel XE#2284]) -> [SKIP][407] ([Intel XE#4945]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][408] ([Intel XE#4650]) -> [SKIP][409] ([Intel XE#4945])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][410] ([Intel XE#4733]) -> [SKIP][411] ([Intel XE#4945]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][412] ([Intel XE#4945]) -> [SKIP][413] ([Intel XE#4733]) +7 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][414] ([Intel XE#944]) -> [SKIP][415] ([Intel XE#4945]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][416] ([Intel XE#4945]) -> [SKIP][417] ([Intel XE#944]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][418] ([Intel XE#4945]) -> [SKIP][419] ([Intel XE#4130])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][420] ([Intel XE#4945]) -> [SKIP][421] ([Intel XE#4273])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][422] ([Intel XE#4945]) -> [SKIP][423] ([Intel XE#4351])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4445
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5377
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe -> xe-pw-152277v1

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe: 54ccd087aec954ea34b880223a17e4579eecedbe
  xe-pw-152277v1: 152277v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/index.html

--===============7965753297512960461==
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
<tr><td><b>Series:</b></td><td>User readable error codes on atomic_ioctl failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152277/">https://patchwork.freedesktop.org/series/152277/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe_FULL -&gt; xe-pw-152277v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152277v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152277v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152277v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-3/igt@kms_atomic@atomic-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-3/igt@kms_atomic@atomic-invalid-params.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-6/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-1/igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> +257 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">FAIL</a> +868 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_flip@bo-too-big@d-dp4.html">FAIL</a> +292 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">FAIL</a> +421 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right@pipe-a.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_plane@plane-panning-top-left@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-top-left@pipe-b.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-464/igt@kms_setmode@basic.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-433/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_setmode@basic-clone-single-crtc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-464/igt@xe_pm@d3cold-i2c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pm@d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-433/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@xe_pm@d3hot-i2c.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pipe_stress@stress-xrgb8888-4tiled}:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152277v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_addfb_basic@size-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +11 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427">Intel XE#4427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5377">Intel XE#5377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-466/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4445">Intel XE#4445</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +392 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +71 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> +608 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679">Intel XE#5679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-433/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_async_flips@test-cursor-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907">Intel XE#4907</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907">Intel XE#4907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_flip@dpms-off-confusion-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5377">Intel XE#5377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-6/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152277v1/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe -&gt; xe-pw-152277v1</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3488-54ccd087aec954ea34b880223a17e4579eecedbe: 54ccd087aec954ea34b880223a17e4579eecedbe<br />
  xe-pw-152277v1: 152277v1</p>

</body>
</html>

--===============7965753297512960461==--
