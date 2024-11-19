Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD47D6C2B4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 21:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF83B10E376;
	Tue, 19 Nov 2024 21:52:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1092A10E376;
 Tue, 19 Nov 2024 21:52:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5385867689225695140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Display_Global_Histogram_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 21:52:25 -0000
Message-ID: <173205314507.468725.2418248514679452610@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
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

--===============5385867689225695140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Display Global Histogram (rev3)
URL   : https://patchwork.freedesktop.org/series/138867/
State : failure

== Summary ==

CI Bug Log - changes from xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192_full -> xe-pw-138867v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138867v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138867v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138867v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][5] +6 other tests dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][6] -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][8] +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9] +3 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][10] +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][11] +14 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] +9 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [INCOMPLETE][14] ([Intel XE#2594]) -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][16] -> [DMESG-WARN][17] +3 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-bmg:          [INCOMPLETE][18] -> [DMESG-WARN][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_pm_rpm@cursor-dpms.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#2446]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_pm_rpm@i2c.html

  * igt@kms_sequence@get-forked-busy:
    - shard-bmg:          [INCOMPLETE][22] ([Intel XE#3468]) -> [INCOMPLETE][23] +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_sequence@get-forked-busy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_sequence@get-forked-busy.html

  * igt@kms_vblank@query-forked@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][24] -> [DMESG-FAIL][25] +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_vblank@query-forked@pipe-a-dp-2.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_vblank@query-forked@pipe-a-dp-2.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [SKIP][26] ([Intel XE#1130]) -> [DMESG-WARN][27] +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html

  
Known issues
------------

  Here are the changes found in xe-pw-138867v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#1885])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#3339])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#2134]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@fbdev@unaligned-read.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1125])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][35] -> [FAIL][36] ([Intel XE#1426]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2370])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2327]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1407])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2136]) +18 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1033])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1124]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1124]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1124]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#367]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#367]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +139 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2669]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3432])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#616]) +7 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2907])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#306])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#373]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2252]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#373]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][66] ([Intel XE#2715]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#1188])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2321]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#308])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1424]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#309]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#877]) +2 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][76] ([Intel XE#877])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2286])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([i915#3804])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2423])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_dp_aux_dev.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:
    - shard-bmg:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#3468]) +1 other test dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2244])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2374])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1421])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][86] ([Intel XE#3468]) +5 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][87] ([Intel XE#1727] / [Intel XE#2597])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][88] ([Intel XE#1195] / [Intel XE#1727] / [Intel XE#2049] / [Intel XE#2597])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][89] ([Intel XE#3468])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][90] ([Intel XE#3468])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][91] ([Intel XE#3468])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][92] ([Intel XE#1727])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][93] ([Intel XE#1727]) +1 other test dmesg-fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][94] ([Intel XE#1727])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
    - shard-adlp:         [PASS][97] -> [FAIL][98] ([Intel XE#886])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-6/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-3/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][99] ([Intel XE#1195] / [Intel XE#1727]) +1 other test incomplete
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401] / [Intel XE#1745])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2293]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1397] / [Intel XE#1745])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1397])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#455]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:
    - shard-bmg:          [PASS][107] -> [DMESG-FAIL][108] ([Intel XE#3468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs:
    - shard-bmg:          [PASS][109] -> [DMESG-FAIL][110] ([Intel XE#2705])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#651]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2311]) +20 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#2136]) +16 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#656]) +9 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [FAIL][116] ([Intel XE#2333]) +4 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#651]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#653]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2313]) +15 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][121] ([Intel XE#2594])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2934])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][123] -> [DMESG-WARN][124] ([Intel XE#3086]) +5 other tests dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][125] -> [INCOMPLETE][126] ([Intel XE#1195]) +1 other test incomplete
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#599]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2393])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-bmg:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#2566])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#870])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#736])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#1430])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2499])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-lnl:          [PASS][139] -> [DMESG-WARN][140] ([Intel XE#3184]) +1 other test dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_pm_rpm@cursor.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [PASS][141] -> [SKIP][142] ([Intel XE#2446])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_rpm@dpms-lpsp.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1439])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2893])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1489]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#1489]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2387])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1406]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#3414])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#2423] / [i915#2575]) +68 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2413])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [PASS][155] -> [ABORT][156] ([Intel XE#1034] / [Intel XE#2625])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][157] -> [ABORT][158] ([Intel XE#1034])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][159] ([Intel XE#1195]) +2 other tests incomplete
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1499])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#756])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#2905]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2905]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2905]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          NOTRUN -> [FAIL][165] ([Intel XE#1000])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#688]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][167] ([Intel XE#1473])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#1130]) +123 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2322]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1392]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1130]) +27 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#288]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][174] -> [DMESG-FAIL][175] ([Intel XE#2687] / [Intel XE#3371])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          NOTRUN -> [FAIL][176] ([Intel XE#3499])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][177] ([Intel XE#3467])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][178] ([Intel XE#3467])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][179] ([Intel XE#3466]) +1 other test dmesg-fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#1192])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2541])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#2839] / [Intel XE#977])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][183] ([Intel XE#1616])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][184] ([Intel XE#1727])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_pm@s4-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][185] ([Intel XE#1727])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][186] -> [ABORT][187] ([Intel XE#1358] / [Intel XE#1607])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#944])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#944]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][190] ([Intel XE#3466]) +1 other test dmesg-warn
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][191] ([Intel XE#2919])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1885]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#3130] / [Intel XE#3249]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#2134]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@fbdev@nullptr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][198] ([Intel XE#827]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2423] / [i915#2575]) -> [PASS][201] +102 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2136]) -> [PASS][203] +35 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [DMESG-WARN][206] ([Intel XE#3468]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [DMESG-WARN][208] ([Intel XE#2932]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_cursor_legacy@torture-move@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][210] -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_cursor_legacy@torture-move@all-pipes.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html

  * igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#877]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-4/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [DMESG-FAIL][214] -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [FAIL][216] -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [FAIL][218] ([Intel XE#2882]) -> [PASS][219] +3 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][221] +8 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - shard-lnl:          [DMESG-WARN][222] -> [PASS][223] +27 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [INCOMPLETE][224] -> [PASS][225] +3 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][226] ([Intel XE#1503]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2446]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][230] ([Intel XE#2042]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][232] ([Intel XE#3184]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_psr@fbc-psr-sprite-blt@edp-1:
    - shard-lnl:          [DMESG-WARN][234] ([Intel XE#3514]) -> [PASS][235] +5 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_psr@fbc-psr-sprite-blt@edp-1.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-blt@edp-1.html

  * igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][236] -> [PASS][237] +17 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [DMESG-WARN][238] ([Intel XE#3466]) -> [PASS][239] +3 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-3/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1130]) -> [PASS][241] +181 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * {igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare}:
    - shard-adlp:         [DMESG-WARN][242] ([Intel XE#3086]) -> [PASS][243] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][244] ([Intel XE#1794]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_pm@s4-mocs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [FAIL][246] ([Intel XE#3507]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@xe_sriov_flr@flr-vf1-clear.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1885]) -> [DMESG-WARN][249] ([Intel XE#3468])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][250] ([Intel XE#1033]) -> [DMESG-WARN][251] ([Intel XE#1033])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][252] ([Intel XE#827]) -> [DMESG-WARN][253] ([Intel XE#1033])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#873]) -> [SKIP][255] ([Intel XE#2423] / [i915#2575])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][257] ([Intel XE#316])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#316]) -> [SKIP][259] ([Intel XE#2136] / [Intel XE#2351])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [INCOMPLETE][260] ([Intel XE#1195] / [Intel XE#402]) -> [SKIP][261] ([Intel XE#2136] / [Intel XE#2351])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#316]) -> [SKIP][263] ([Intel XE#2136]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2136]) -> [SKIP][265] ([Intel XE#316]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2136]) -> [INCOMPLETE][267] ([Intel XE#1195] / [Intel XE#3225] / [Intel XE#402])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2136]) -> [SKIP][269] ([Intel XE#1124]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1124]) -> [SKIP][271] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#619]) -> [SKIP][273] ([Intel XE#2136] / [Intel XE#2351])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1124]) -> [SKIP][275] ([Intel XE#2136]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][277] ([Intel XE#1124]) +6 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#367]) -> [SKIP][279] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2423] / [i915#2575]) -> [SKIP][281] ([Intel XE#2191])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2423] / [i915#2575]) -> [SKIP][283] ([Intel XE#367]) +4 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][285] ([Intel XE#2136]) +12 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][287] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2136]) -> [SKIP][289] ([Intel XE#2907]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][290] -> [SKIP][291] ([Intel XE#3442])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][292] ([Intel XE#1195]) -> [SKIP][293] ([Intel XE#2136])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][294] -> [SKIP][295] ([Intel XE#455] / [Intel XE#787])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2136]) -> [FAIL][297] ([Intel XE#616])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2907]) -> [SKIP][299] ([Intel XE#2136])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][301] ([Intel XE#2136] / [Intel XE#2351])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][303] ([Intel XE#1195])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2136]) -> [SKIP][305] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#306]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2423] / [i915#2575]) -> [SKIP][309] ([Intel XE#306]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#373]) -> [SKIP][311] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2423] / [i915#2575]) -> [SKIP][313] ([Intel XE#373]) +11 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][314] ([Intel XE#1178]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2423] / [i915#2575]) -> [SKIP][317] ([Intel XE#307])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [FAIL][319] ([Intel XE#1188])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_content_protection@uevent.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#308]) -> [SKIP][321] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2423] / [i915#2575]) -> [SKIP][323] ([Intel XE#308])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#455]) -> [SKIP][325] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2423] / [i915#2575]) -> [SKIP][327] ([Intel XE#455]) +10 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2423] / [i915#2575]) -> [SKIP][329] ([Intel XE#323])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [INCOMPLETE][330] ([Intel XE#3468]) -> [DMESG-FAIL][331] ([Intel XE#3468])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-FAIL][332] -> [DMESG-FAIL][333] ([Intel XE#2705])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#455]) -> [SKIP][335] ([Intel XE#2351])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_dsc@dsc-basic.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#455]) -> [SKIP][337] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#2136]) -> [SKIP][339] ([Intel XE#455]) +5 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#776]) -> [SKIP][341] ([Intel XE#2136])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1138]) -> [SKIP][343] ([Intel XE#2423] / [i915#2575])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2423] / [i915#2575]) -> [SKIP][345] ([Intel XE#1135])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][346] ([Intel XE#301]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][348] ([Intel XE#3487]) -> [DMESG-WARN][349] ([Intel XE#3468]) +1 other test dmesg-warn
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][350] -> [FAIL][351] ([Intel XE#3487])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [INCOMPLETE][352] ([Intel XE#2635] / [Intel XE#3468]) -> [DMESG-WARN][353] ([Intel XE#3468])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][354] -> [DMESG-WARN][355] ([Intel XE#3468])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136]) -> [INCOMPLETE][357] ([Intel XE#1195] / [Intel XE#1727])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][358] ([Intel XE#1727]) -> [DMESG-WARN][359] ([Intel XE#1727]) +1 other test dmesg-warn
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#455]) -> [SKIP][361] ([Intel XE#2136])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2-set2:     [DMESG-WARN][362] -> [SKIP][363] ([Intel XE#2136] / [Intel XE#2351])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-FAIL][364] ([Intel XE#3468]) -> [DMESG-FAIL][365] ([Intel XE#2705])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-dg2-set2:     [DMESG-WARN][366] -> [SKIP][367] ([Intel XE#2423] / [i915#2575])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2423] / [i915#2575]) -> [SKIP][369] ([i915#5274])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#651]) -> [SKIP][371] ([Intel XE#2136]) +19 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][373] ([Intel XE#651]) +12 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#658]) -> [SKIP][375] ([Intel XE#2136] / [Intel XE#2351])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136]) -> [SKIP][377] ([Intel XE#651]) +21 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#651]) -> [SKIP][379] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136]) -> [SKIP][381] ([Intel XE#653]) +26 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][383] ([Intel XE#658])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#653]) -> [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][387] ([Intel XE#653]) +8 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#653]) -> [SKIP][389] ([Intel XE#2136]) +17 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#605]) -> [SKIP][391] ([Intel XE#2423] / [i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][392] -> [SKIP][393] ([Intel XE#3374])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#2925])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2136]) -> [SKIP][397] ([Intel XE#2927])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2423] / [i915#2575]) -> [SKIP][399] ([Intel XE#356])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [INCOMPLETE][400] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][401] ([Intel XE#2423] / [i915#2575])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2423] / [i915#2575]) -> [SKIP][403] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][405] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2136]) -> [SKIP][407] ([Intel XE#2938])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#870]) -> [SKIP][409] ([Intel XE#2136])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2136]) -> [SKIP][411] ([Intel XE#870])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1129]) -> [SKIP][413] ([Intel XE#2136])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][414] -> [SKIP][415] ([Intel XE#3309])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [DMESG-WARN][416] ([Intel XE#3468]) -> [SKIP][417] ([Intel XE#2136] / [Intel XE#2351])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [ABORT][418] -> [INCOMPLETE][419] ([Intel XE#1195])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][420] ([Intel XE#3468]) -> [SKIP][421] ([Intel XE#2446])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2446]) -> [DMESG-FAIL][423] ([Intel XE#3468])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [DMESG-WARN][424] -> [SKIP][425] ([Intel XE#2446]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [DMESG-WARN][426] ([Intel XE#3184] / [Intel XE#3466]) -> [DMESG-WARN][427] ([Intel XE#3466])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-59.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#1489]) -> [SKIP][429] ([Intel XE#2136]) +4 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#1489]) +10 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2136]) -> [SKIP][433] ([Intel XE#1122])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1122]) -> [SKIP][435] ([Intel XE#2136])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][437] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][441] ([Intel XE#2136]) +7 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][443] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_psr@pr-dpms.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2351]) -> [SKIP][445] ([Intel XE#2850] / [Intel XE#929])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#3414]) -> [SKIP][447] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2423] / [i915#2575]) -> [SKIP][449] ([Intel XE#3414]) +3 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#1127]) -> [SKIP][451] ([Intel XE#2423] / [i915#2575])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2423] / [i915#2575]) -> [FAIL][453] ([Intel XE#1729])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][455] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1130]) -> [SKIP][457] ([Intel XE#1123])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#1123]) -> [SKIP][459] ([Intel XE#1130])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#1126]) -> [SKIP][461] ([Intel XE#1130])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#1130]) -> [SKIP][463] ([Intel XE#1126])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#1130]) -> [SKIP][465] ([Intel XE#2905]) +16 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2905]) -> [SKIP][467] ([Intel XE#1130]) +4 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_eudebug_online@preempt-breakpoint.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][468] ([Intel XE#1600]) -> [SKIP][469] ([Intel XE#1130])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1130]) -> [FAIL][471] ([Intel XE#1600])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#288]) -> [SKIP][473] ([Intel XE#1130]) +19 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1130]) -> [SKIP][475] ([Intel XE#288]) +33 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1130]) -> [SKIP][477] ([Intel XE#2360]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#1130]) -> [DMESG-WARN][479] ([Intel XE#358])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [DMESG-WARN][480] ([Intel XE#3343]) -> [SKIP][481] ([Intel XE#1130]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#1130]) -> [DMESG-WARN][483] ([Intel XE#3343]) +1 other test dmesg-warn
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1130]) -> [DMESG-WARN][485] ([Intel XE#3467]) +2 other tests dmesg-warn
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [DMESG-WARN][486] ([Intel XE#3467]) -> [SKIP][487] ([Intel XE#1130])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1130]) -> [SKIP][489] ([Intel XE#2541]) +7 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2541]) -> [SKIP][491] ([Intel XE#1130]) +6 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][493] ([Intel XE#1130])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1130]) -> [SKIP][495] ([Intel XE#979])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#1130]) -> [SKIP][497] ([Intel XE#2284] / [Intel XE#366])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#2284]) -> [SKIP][499] ([Intel XE#1130])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#1130]) -> [DMESG-WARN][501] ([Intel XE#3468]) +1 other test dmesg-warn
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pm@d3hot-mmap-vram.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][503] ([Intel XE#1130]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#1130]) -> [SKIP][505] ([Intel XE#579])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#944]) -> [SKIP][507] ([Intel XE#1130]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1130]) -> [SKIP][509] ([Intel XE#944]) +2 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-dg2-set2:     [DMESG-WARN][510] -> [SKIP][511] ([Intel XE#1130]) +3 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192 -> xe-pw-138867v3

  IGT_8116: 10a7dcaa598461073d6c7268704f32043af8722f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192: ae16c37991aa8ab2afc0309ff88d9ccada395192
  xe-pw-138867v3: 138867v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html

--===============5385867689225695140==
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
<tr><td><b>Series:</b></td><td>Display Global Histogram (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138867/">https://patchwork.freedesktop.org/series/138867/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192_full -&gt; xe-pw-138867v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138867v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138867v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138867v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-FAIL</a> +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_pm_rpm@cursor-dpms.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_pm_rpm@i2c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_sequence@get-forked-busy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_sequence@get-forked-busy.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_vblank@query-forked@pipe-a-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_vblank@query-forked@pipe-a-dp-2.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138867v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@bd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-6/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-3/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_hdr@static-swap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_pm_rpm@cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_live_ktest@xe_dma_buf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +102 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_cursor_legacy@torture-move@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-4/igt@kms_display_modes@extended-mode-basic@pipe-b-dp-2-pipe-c-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_getfb@getfb2-handle-not-fb.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-7/igt@kms_psr@fbc-psr-sprite-blt@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514">Intel XE#3514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-blt@edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-3/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +181 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-8/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507">Intel XE#3507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-4/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192/shard-dg2-463/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138867v3/shard-dg2-434/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192 -&gt; xe-pw-138867v3</li>
</ul>
<p>IGT_8116: 10a7dcaa598461073d6c7268704f32043af8722f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2250-ae16c37991aa8ab2afc0309ff88d9ccada395192: ae16c37991aa8ab2afc0309ff88d9ccada395192<br />
  xe-pw-138867v3: 138867v3</p>

</body>
</html>

--===============5385867689225695140==--
