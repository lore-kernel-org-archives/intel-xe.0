Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE27ECF8859
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7410E0E0;
	Thu, 20 Nov 2025 13:31:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88010E0E0;
 Thu, 20 Nov 2025 13:31:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4555630401572757283=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_CI_test_with_forcedac?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 13:31:43 -0000
Message-ID: <176364550362.13718.10099518139526195741@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120095532.264668-1-dev@lankhorst.se>
In-Reply-To: <20251120095532.264668-1-dev@lankhorst.se>
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

--===============4555630401572757283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CI test with forcedac
URL   : https://patchwork.freedesktop.org/series/157830/
State : failure

== Summary ==

CI Bug Log - changes from xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b_FULL -> xe-pw-157830v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157830v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157830v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157830v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-157830v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#3908]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#4543])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#787]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#373])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#323])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a1:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#4543]) +3 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-9/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#5208])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#651]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#656])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#6312])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#653]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#653])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#455])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#1489])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#5626]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#4837] / [Intel XE#5565])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#288]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#288] / [Intel XE#5561])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#3868])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-6/igt@xe_exec_reset@cm-close-fd.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#4837]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4915]) +38 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#4915]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#5893])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#3573]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2284] / [Intel XE#366])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#6255])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#6362]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_pm_residency@idle-residency.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#944])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][51] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][53] ([Intel XE#6168] / [i915#14968]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][55] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][57] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][58] +4 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][59] ([Intel XE#4543]) -> [PASS][60] +3 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][61] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][63] ([Intel XE#4543]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-adlp:         [ABORT][65] ([Intel XE#2953]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_force_connector_basic@force-connector-state.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][67] ([Intel XE#5625]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_gt_freq@freq_range_idle:
    - shard-dg2-set2:     [FAIL][69] ([Intel XE#6407]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@xe_gt_freq@freq_range_idle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:
    - shard-lnl:          [FAIL][71] ([Intel XE#6251]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [DMESG-FAIL][73] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][75] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][76] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#362]) -> [FAIL][78] ([Intel XE#1729])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#1500]) -> [SKIP][80] ([Intel XE#362])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-adlp:         [DMESG-FAIL][81] ([Intel XE#3868] / [Intel XE#3876] / [Intel XE#5213] / [Intel XE#5545]) -> [DMESG-FAIL][82] ([Intel XE#5213] / [Intel XE#5545])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b -> xe-pw-157830v1

  IGT_8635: 8635
  xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b: 9e9925b18a12a6226ec09a7ff19af83470b4534b
  xe-pw-157830v1: 157830v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/index.html

--===============4555630401572757283==
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
<tr><td><b>Series:</b></td><td>CI test with forcedac</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157830/">https://patchwork.freedesktop.org/series/157830/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b_FULL -&gt; xe-pw-157830v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157830v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157830v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157830v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157830v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-9/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-6/igt@xe_exec_reset@cm-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255">Intel XE#6255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362">Intel XE#6362</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968">i915#14968</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@xe_gt_freq@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407">Intel XE#6407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-433/igt@xe_gt_freq@freq_range_idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157830v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b -&gt; xe-pw-157830v1</li>
</ul>
<p>IGT_8635: 8635<br />
  xe-4132-9e9925b18a12a6226ec09a7ff19af83470b4534b: 9e9925b18a12a6226ec09a7ff19af83470b4534b<br />
  xe-pw-157830v1: 157830v1</p>

</body>
</html>

--===============4555630401572757283==--
