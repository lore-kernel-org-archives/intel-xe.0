Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B8C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 18:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597610E9CE;
	Fri,  9 Aug 2024 18:02:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153FC10E9CE;
 Fri,  9 Aug 2024 18:02:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0075456775693993382=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Parallel_submission_of_dma_fenc?=
 =?utf-8?q?e_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 18:02:48 -0000
Message-ID: <172322656806.552689.17280507893262964775@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809155156.1955925-1-francois.dugast@intel.com>
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
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

--===============0075456775693993382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev9)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

CI Bug Log - changes from xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1_full -> xe-pw-136192v9_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136192v9_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136192v9_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136192v9_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_vrr@flip-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][6] -> [DMESG-WARN][7] +4 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - {shard-bmg}:        [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - {shard-bmg}:        [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - {shard-bmg}:        [SKIP][12] ([Intel XE#2426]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][14] ([Intel XE#899]) -> [DMESG-WARN][15] +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html

  
Known issues
------------

  Here are the changes found in xe-pw-136192v9_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#1426]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1659])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1204])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#324]) +1 other test dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1231]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1413])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#309])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#2190])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#323])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#877]) +1 other test dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1138] / [Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#310])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#2049])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#1901] / [Intel XE#2028]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp4:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1195]) +2 other tests incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1901])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [PASS][56] -> [SKIP][57] ([Intel XE#1201]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#1874]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#1861])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#656])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#2028]) +9 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1162])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][70] ([Intel XE#1035] / [Intel XE#1195])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][71] ([Intel XE#2078]) +1 other test warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-4:
    - shard-lnl:          [PASS][72] -> [DMESG-WARN][73] ([Intel XE#324]) +1 other test dmesg-warn
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-adlp:         [PASS][74] -> [INCOMPLETE][75] ([Intel XE#1195])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2318]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          [PASS][79] -> [SKIP][80] ([Intel XE#870]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_pm_backlight@fade.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [PASS][81] -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#1705]) +1 other test dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1127])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][89] -> [DMESG-WARN][90] ([Intel XE#2019]) +1 other test dmesg-warn
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#2443]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          NOTRUN -> [FAIL][93] ([Intel XE#2443]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][95] -> [TIMEOUT][96] ([Intel XE#1473])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:
    - shard-adlp:         [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2226]) +6 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][99] ([Intel XE#2226])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#1392])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1392]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][103] -> [TIMEOUT][104] ([Intel XE#2105])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1192] / [Intel XE#1201])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#1192])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#2136])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_module_load@many-reload.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#2207])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_oa@buffer-fill.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#2284])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2284] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][114] -> [ABORT][115] ([Intel XE#1358])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][116] -> [DMESG-WARN][117] ([Intel XE#569])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1794])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][119] -> [ABORT][120] ([Intel XE#1358] / [Intel XE#1607])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#958])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#944])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][124] -> [FAIL][125] ([Intel XE#1081])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@large-misaligned-binds-16777216:
    - shard-adlp:         [PASS][126] -> [DMESG-WARN][127] ([Intel XE#1727] / [Intel XE#2226])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-16777216.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_vm@large-misaligned-binds-16777216.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - {shard-bmg}:        [DMESG-WARN][128] ([Intel XE#1033]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_atomic_transition@modeset-transition:
    - {shard-bmg}:        [DMESG-WARN][130] ([Intel XE#877]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][132] ([Intel XE#1426]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][134] ([Intel XE#1659]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [FAIL][136] ([Intel XE#2436]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-adlp:         [SKIP][138] ([Intel XE#1201]) -> [PASS][139] +4 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_color@ctm-blue-to-red.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][140] ([Intel XE#2028]) -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][142] ([Intel XE#886]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#1551]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#324]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][148] ([Intel XE#1874]) -> [PASS][149] +5 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][150] ([Intel XE#1861]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][152] ([Intel XE#324]) -> [PASS][153] +3 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_plane@plane-position-covered.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][154] ([Intel XE#324]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-adlp:         [INCOMPLETE][156] ([Intel XE#1195]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-7efc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [FAIL][158] ([Intel XE#2455]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-7/igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-adlp:         [SKIP][160] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_pm_backlight@fade-with-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][164] ([Intel XE#1430]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          [FAIL][166] ([Intel XE#1649]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][168] ([Intel XE#771] / [Intel XE#899]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#771] / [Intel XE#899]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][172] ([Intel XE#899]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#899]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][176] ([Intel XE#2443]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_vrr@max-min.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#1600]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][180] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][182] ([Intel XE#1473]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     [TIMEOUT][184] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - {shard-bmg}:        [DMESG-WARN][186] -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][188] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][190] ([Intel XE#2343]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - {shard-bmg}:        [FAIL][192] ([Intel XE#2343]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-bal-rebind:
    - shard-adlp:         [INCOMPLETE][194] ([Intel XE#1169] / [Intel XE#1195]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@xe_exec_threads@threads-bal-rebind.html

  * igt@xe_exec_threads@threads-shared-vm-userptr:
    - shard-adlp:         [DMESG-WARN][196] ([Intel XE#1727] / [Intel XE#2226]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [DMESG-WARN][198] ([Intel XE#2019]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@xe_module_load@reload.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [FAIL][200] -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-bmg}:        [INCOMPLETE][202] -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [DMESG-WARN][206] ([Intel XE#2280]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@xe_pm@s4-mocs.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][208] ([Intel XE#1794]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-end:
    - shard-adlp:         [DMESG-WARN][210] ([Intel XE#2226]) -> [PASS][211] +11 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-many-end.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-end.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][213] ([Intel XE#316]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][214] ([Intel XE#1201]) -> [SKIP][215] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#316]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][218] ([Intel XE#324]) -> [FAIL][219] ([Intel XE#1231]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#610]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#610]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1124]) -> [SKIP][223] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][225] ([Intel XE#1124]) +6 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][227] ([Intel XE#346])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2191]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#2191])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][231] ([Intel XE#2191]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][233] ([Intel XE#367])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#367]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#787]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#787]) +97 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][238] ([Intel XE#1201]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][240] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][241] ([Intel XE#1201])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][243] ([Intel XE#787]) +62 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][247] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#306]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#373]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][253] ([Intel XE#373]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#307]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#307])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-adlp:         [SKIP][256] ([Intel XE#1201]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#455])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_content_protection@uevent.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#308]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         [SKIP][260] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][261] ([Intel XE#1201])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#323]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#323])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [i915#3804]) -> [SKIP][265] ([i915#3804])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#455]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][269] ([Intel XE#703])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][270] ([Intel XE#1551]) -> [INCOMPLETE][271] ([Intel XE#1195] / [Intel XE#2049])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][273] ([Intel XE#455]) +14 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][274] ([i915#5274]) -> [SKIP][275] ([Intel XE#1201] / [i915#5274])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][276] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][277] ([Intel XE#1201])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][278] ([Intel XE#1201]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#651])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][280] ([Intel XE#1201]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#651]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][285] ([Intel XE#651]) +16 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-adlp:         [SKIP][286] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][287] ([Intel XE#1201])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][288] ([Intel XE#1201]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#653])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#653]) +27 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][293] ([Intel XE#653]) +17 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][294] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][295] ([Intel XE#1201]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][296] ([Intel XE#324]) -> [DMESG-WARN][297] ([Intel XE#324])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#498]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2318]) -> [SKIP][303] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][307] ([Intel XE#2318]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][309] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][311] ([Intel XE#1489]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1489]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][315] ([Intel XE#1122])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#929]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#929]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#327]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         [DMESG-WARN][322] ([Intel XE#2226]) -> [FAIL][323] ([Intel XE#1174])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_sysfs_edid_timing.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2168]) -> [SKIP][325] ([Intel XE#1201] / [Intel XE#2168])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_vrr@cmrr.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#756]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#756])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1123]) -> [SKIP][329] ([Intel XE#1123] / [Intel XE#1201])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][331] ([Intel XE#288]) +17 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#288]) -> [SKIP][333] ([Intel XE#1201] / [Intel XE#288]) +23 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2360]) -> [SKIP][335] ([Intel XE#1201] / [Intel XE#2360]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#512]) -> [SKIP][337] ([Intel XE#1201] / [Intel XE#512])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_mmap@small-bar.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#378]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#378]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_module_load@force-load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2207]) -> [SKIP][341] ([Intel XE#1201] / [Intel XE#2207]) +4 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1201] / [Intel XE#2207]) -> [SKIP][343] ([Intel XE#2207]) +4 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][345] ([Intel XE#979])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][347] ([Intel XE#2284] / [Intel XE#366])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_pm@d3cold-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#944]) -> [SKIP][351] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][353] ([Intel XE#944]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-FAIL][354] ([Intel XE#1760]) -> [DMESG-WARN][355] ([Intel XE#1760])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-dg2-set2:     [DMESG-WARN][356] ([Intel XE#1760]) -> [DMESG-FAIL][357] ([Intel XE#1760])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2190]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2190
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2455
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7963 -> IGT_7964
  * Linux: xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1 -> xe-pw-136192v9

  IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1: 8d0f83b389ec64b9f7f9b2ee241fc352346868f1
  xe-pw-136192v9: 136192v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/index.html

--===============0075456775693993382==
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
<tr><td><b>Series:</b></td><td>Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136192/">https://patchwork.freedesktop.org/series/136192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1_full -&gt; xe-pw-136192v9_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136192v9_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136192v9_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136192v9_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_vrr@flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_vrr@flip-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136192v9_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2190">Intel XE#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_pm_backlight@fade.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-16777216.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_vm@large-misaligned-binds-16777216.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-4/igt@kms_atomic_transition@modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_color@ctm-blue-to-red.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_alpha_blend@coverage-7efc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_plane_alpha_blend@coverage-7efc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-7/igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2455">Intel XE#2455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@kms_plane_multiple@tiling-4@pipe-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-3/igt@xe_evict@evict-beng-threads-small-multi-vm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_exec_threads@threads-bal-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@xe_exec_threads@threads-bal-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_module_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-end:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-many-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-end.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-9/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-9/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v9/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7963 -&gt; IGT_7964</li>
<li>Linux: xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1 -&gt; xe-pw-136192v9</li>
</ul>
<p>IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1: 8d0f83b389ec64b9f7f9b2ee241fc352346868f1<br />
  xe-pw-136192v9: 136192v9</p>

</body>
</html>

--===============0075456775693993382==--
