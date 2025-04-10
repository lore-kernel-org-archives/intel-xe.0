Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD29CC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 10:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F25310E97E;
	Thu, 10 Apr 2025 10:57:23 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E2510E971;
 Thu, 10 Apr 2025 10:57:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4713185112700344403=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_error_capture_?=
 =?utf-8?q?cleanups_and_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 10:57:22 -0000
Message-ID: <174428264220.55177.8099988408818213682@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744208554.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744208554.git.jani.nikula@intel.com>
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

--===============4713185112700344403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: error capture cleanups and refactor
URL   : https://patchwork.freedesktop.org/series/147474/
State : failure

== Summary ==

CI Bug Log - changes from xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_FULL -> xe-pw-147474v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147474v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147474v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147474v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@xe_exec_threads@threads-hang-shared-vm-basic:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-3/igt@xe_exec_threads@threads-hang-shared-vm-basic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-436/igt@xe_pm@s4-mocs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_pm@s4-mocs.html

  
New tests
---------

  New tests have been introduced between xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8_FULL and xe-pw-147474v1_FULL:

### New IGT tests (1) ###

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  

Known issues
------------

  Here are the changes found in xe-pw-147474v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1125])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-lnl:          [PASS][13] -> [ABORT][14] ([Intel XE#4624])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1465])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2233])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#3767]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#3908]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#619])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124]) +10 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][24] ([Intel XE#4543])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][26] ([Intel XE#4173])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +10 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1428])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#367]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#367]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#787]) +146 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#787]) +47 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#2907]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2907])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#3442])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#3432])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][49] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2724])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4417]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#306])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#306]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#373]) +10 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2252]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#373]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#373]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2341]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2390])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#307]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#1178])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1468])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1178]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2321])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2320]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#308]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1424])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#309]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#323]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2286])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#309]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2291]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#309]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#309]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#1475])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][80] -> [INCOMPLETE][81] ([Intel XE#3226])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#4667])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#4302])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1340])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#4356])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2244])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2244]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#4422])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4422])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4156])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#702])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1137])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1135])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1421])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#310]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#3321]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#310]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2316]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][102] -> [FAIL][103] ([Intel XE#301]) +6 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#301]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-adlp:         [PASS][108] -> [DMESG-WARN][109] ([Intel XE#4173]) +6 other tests dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1401] / [Intel XE#1745])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1401])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2293]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1397]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#455]) +25 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][117] -> [DMESG-FAIL][118] ([Intel XE#4543]) +6 other tests dmesg-fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#352])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#656]) +39 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2311]) +25 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#4141]) +12 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#656]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#658])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#651]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#651]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#651]) +13 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#653]) +19 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2312]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#656]) +10 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#656]) +14 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2313]) +23 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2352])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1158])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#653]) +12 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2340])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#455]) +12 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1503]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#1503])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2927]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#4359])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][144] ([Intel XE#1035])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][145] ([Intel XE#4735])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][146] ([Intel XE#2078]) +1 other test warn
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-bmg:          [PASS][147] -> [INCOMPLETE][148] ([Intel XE#1035]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_plane@plane-position-hole-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2763]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2763]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2938])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#870])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#718])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][156] ([Intel XE#2029])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#836]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#1489]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1489]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4608]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#1489]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#1122]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#4609])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1406]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2414])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#3414] / [Intel XE#3904])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#3414] / [Intel XE#3904]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1127]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#3414])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][175] -> [SKIP][176] ([Intel XE#455])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#362])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#362])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][179] ([Intel XE#771]) +3 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1499])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#1499])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#756]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#1447])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1126])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#1062])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2504])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#4497])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#4497]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2905] / [Intel XE#3889])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2905] / [Intel XE#3889])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#2905] / [Intel XE#3889])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#2905]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#4577])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#2905]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#2905]) +9 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#688])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_evict@evict-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#688]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#1392]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][201] -> [SKIP][202] ([Intel XE#1392]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#1392]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2322]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][205] ([Intel XE#288]) +28 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#288]) +19 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#2360])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#2905]) +11 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#2229])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229]) -> ([PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [SKIP][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254]) ([Intel XE#378])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][255] -> [DMESG-WARN][256] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@xe_module_load@many-reload.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][257] ([Intel XE#379])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#2248])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][261] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][263] ([Intel XE#1337])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][264] ([Intel XE#1420])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][265] ([Intel XE#1173])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#2284]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#2284] / [Intel XE#366])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][269] ([Intel XE#584])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][270] -> [ABORT][271] ([Intel XE#1794])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2284] / [Intel XE#366])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         NOTRUN -> [ABORT][273] ([Intel XE#1794])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#579])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][275] ([Intel XE#4733]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#4733]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#4733]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#944]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-adlp:         NOTRUN -> [SKIP][279] ([Intel XE#944]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][280] ([Intel XE#944]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#4130]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#3342])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][283] ([Intel XE#4273])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#4543]) -> [PASS][285] +10 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][286] ([Intel XE#3884]) -> [PASS][287] +1 other test pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2191]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][290] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][292] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][294] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][295] +1 other test pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][296] ([Intel XE#3124]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][298] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#309]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][302] ([Intel XE#2291]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#4331]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][306] ([Intel XE#2049]) -> [PASS][307] +1 other test pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#310]) -> [PASS][309] +6 other tests pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][310] ([Intel XE#2316]) -> [PASS][311] +4 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][312] ([Intel XE#301]) -> [PASS][313] +3 other tests pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][314] ([Intel XE#301]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][316] ([Intel XE#886]) -> [PASS][317] +2 other tests pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][318] ([Intel XE#4543]) -> [PASS][319] +9 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#656]) -> [PASS][321] +6 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [ABORT][322] ([Intel XE#4624]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#455]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][326] ([Intel XE#616]) -> [PASS][327] +1 other test pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][328] ([Intel XE#1499]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1392]) -> [PASS][331] +4 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-adlp:         [DMESG-WARN][332] ([Intel XE#4173]) -> [PASS][333] +1 other test pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][334] ([Intel XE#4541]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@xe_oa@buffer-size.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][336] ([Intel XE#1794]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-adlp:         [SKIP][338] ([Intel XE#4738]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][340] ([Intel XE#4173]) -> [DMESG-FAIL][341] ([Intel XE#4543])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][343] ([Intel XE#787]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#787]) -> [SKIP][345] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][346] ([Intel XE#2341]) -> [FAIL][347] ([Intel XE#1178])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#455]) -> [FAIL][349] ([Intel XE#1178])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_content_protection@srm.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][350] ([Intel XE#1188]) -> [SKIP][351] ([Intel XE#2341])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-8/igt@kms_content_protection@uevent.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][352] ([Intel XE#2316]) -> [FAIL][353] ([Intel XE#3321])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][354] ([Intel XE#2311]) -> [SKIP][355] ([Intel XE#2312]) +11 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][356] ([Intel XE#2312]) -> [SKIP][357] ([Intel XE#2311]) +8 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#656]) -> [SKIP][359] ([Intel XE#651]) +9 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#651]) -> [SKIP][361] ([Intel XE#656]) +8 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#4141]) -> [SKIP][363] ([Intel XE#2312]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][364] ([Intel XE#2312]) -> [SKIP][365] ([Intel XE#4141]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][366] ([Intel XE#2313]) -> [SKIP][367] ([Intel XE#2312]) +14 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#653]) -> [SKIP][369] ([Intel XE#656]) +12 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> [SKIP][371] ([Intel XE#2313]) +10 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#656]) -> [SKIP][373] ([Intel XE#653]) +10 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#4596]) -> [SKIP][375] ([Intel XE#455])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1061]) -> [FAIL][377] ([Intel XE#1173])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@xe_peer2peer@read.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
  [Intel XE#4738]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4738
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8312 -> IGT_8313
  * Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -> xe-pw-147474v1

  IGT_8312: 8312
  IGT_8313: 8313
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8
  xe-pw-147474v1: 147474v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/index.html

--===============4713185112700344403==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915: error capture cleanups and refacto=
r</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147474/">https://patchwork.freedesktop.org/series/147474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147474v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147474v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2928-c54633598106dbdb97f3aa589587b8176=
009b6d8_FULL -&gt; xe-pw-147474v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147474v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147474v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1474=
74v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_plane@pixel-format-source=
-clamping@pipe-a-plane-0.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-3/igt@xe_exec_=
threads@threads-hang-shared-vm-basic.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@xe_exec_=
threads@threads-hang-shared-vm-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-=
dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.ht=
ml">DMESG-WARN</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-ln=
l-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">=
DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-436/igt@xe_pm@=
s4-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_pm@s4-mocs.html">ABORT</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-1/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_pm@s4-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2928-c54633598106dbdb97f3aa589=
587b8176009b6d8_FULL and xe-pw-147474v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147474v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-5/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries-display-off.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl=
-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/462=
4">Intel XE#4624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_3d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#146=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rota=
te-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rot=
ate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-3/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-v=
s-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shar=
d-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms=
_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@kms_fli=
p@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_f=
lip@modeset-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-147474v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-2/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +39 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-433/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_getfb@getfb2-accept-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-8/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_plane@pixel-format.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_plane@pixel-format-source=
-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4735">Intel XE#4735</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_plane@pixel-format@pipe-=
a-plane-3.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_plan=
e@plane-position-hole-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_plane@plane-po=
sition-hole-dpms.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-3/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-1/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@kms_se=
tmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_setmode=
@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb=
-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/771">Intel XE#771</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@xe_eu_stall@invalid-samplin=
g-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_eu_stall@unprivileged-acc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-=
parameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufe=
nce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-8/igt@xe_eudebug@multiple-sessions.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@xe_evict@evict-beng-large-ext=
ernal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_evict@evict-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/261=
">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpo=
int-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d=
8/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b81760=
09b6d8/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b=
8176009b6d8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa58=
9587b8176009b6d8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f=
3aa589587b8176009b6d8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598106db=
db97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c54633598=
106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928-c546=
33598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2928=
-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147474v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-147474v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47474v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shar=
d-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147474v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
78">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-2/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-4/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-4/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_oa@invalid-remove-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_oa@rc6-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_pat@display-vs-wb-transie=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Int=
el XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-t=
ermination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-adlp-6/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-464/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147474v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">PASS</a> +10 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-=
4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147474v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-d=
g2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-2/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_dp=
_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-436/=
igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-463/igt@kms_fl=
ip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/s=
hard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@kms_flip@2x-=
flip-vs-dpms.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> +4 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-lnl-7/igt@km=
s_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147474v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pr=
i-shrfb-draw-render.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
74v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-d=
raw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#462=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
474v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb=
-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-433/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-=
dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-8/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg=
2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@xe_faul=
t_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147474v1/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queu=
e_create_bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-6/igt@xe_oa@bu=
ffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4541">Intel XE#4541</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@xe_oa@buffer-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-9/igt@xe_pm@s=
4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adlp-1/igt@xe_pm@s4-mul=
tiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-8/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4738">Intel XE#4738</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-adl=
p-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147474v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47474v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-=
6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147474v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-g=
en12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-7/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-463/igt@kms_conten=
t_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-8/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-=
bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474=
v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
74v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147474v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147474v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47474v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-435/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147474v1/shard-dg2-434/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8312 -&gt; IGT_8313</li>
<li>Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -&gt; xe-pw-147=
474v1</li>
</ul>
<p>IGT_8312: 8312<br />
  IGT_8313: 8313<br />
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa5=
89587b8176009b6d8<br />
  xe-pw-147474v1: 147474v1</p>

</body>
</html>

--===============4713185112700344403==--
